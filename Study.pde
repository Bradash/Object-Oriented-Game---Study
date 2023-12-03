ArrayList<Letter> letters;


//Initialize Score
int Score;
boolean kill;
int TimeLimit;
int Time;
int LetterAmount;
int ExpectedScore;
int ActualLimit;
boolean GameStart;
int Multiplier;

void setup(){
  size(400, 400);
    //Letter Arrays
    letters = new ArrayList<Letter>();
    TimeLimit =+ ActualLimit;
    LetterAmount = 1;
    ExpectedScore = 5;
    GameStart = false;
}

void draw() {
  background(75, 65, 50);
  if(GameStart == false){
    rectMode(CENTER);
    noStroke();
    fill(90, 90, 110);
    rect(200, 125, 400, 250);
    fill(60, 60, 100);
    rect(200, 125, 300, 200);
    
    fill(100, 150, 100);
    ellipse(200, 240, 150, 200);
    

    fill(75, 65, 50);
    rect(200, 350, 300, 200);
    
    fill(175, 150, 100);
    circle(200, 150, 100);
    circle(275, 250, 50);
    circle(125, 250, 50);
    
    fill(0);
    rect(175, 150, 30, 10);
    rect(225, 150, 30, 10);
    
    fill(50, 100, 200, 200);
    ellipse(225, 165, 10, 15);
    
    fill(255);
    textSize(50);
    text("Study", 200, 75);
    
    
    
    //Easy, Normal, Hard buttons
    fill(175);
    
    rect(200, 325, 100, 125);
    
    fill(0);
    textSize(25);
    textAlign(CENTER);
    text("Easy", 200, 290);
    text("Normal", 200, 325);
    text("Hard", 200, 360);
    //Easy Mode button
    if (dist(mouseX, mouseY, 200, 280) < 25 && mousePressed) {
      println(millis());
      GameStart = true;
      ActualLimit = 30000;
    }
    //Normal Mode button
    if (dist(mouseX, mouseY, 200, 325) < 25 && mousePressed) {
      println(millis());
      GameStart = true;
      ActualLimit = 15000;
      //Hard Mode button
    }
    if (dist(mouseX, mouseY, 200, 350) < 25 && mousePressed) {
      println(millis());
      GameStart = true;
      ActualLimit = 10000;
    }
  }
 //Game is true
  if(GameStart == true){

  //Letter arrays are limited to the LetterAmount variable
  if (letters.size() < LetterAmount){
     letters.add(new Letter(Time)); 
  }
  
    Time =+ millis();
    //Time resets everytime it hits 0
  if(TimeLimit <= Time){
    Multiplier = Multiplier + 1;
    ExpectedScore = ExpectedScore + 5*Multiplier;
    TimeLimit = ActualLimit + millis();
  }
    //Paper
    fill(175);
  rectMode(CENTER);
  rect(200, 200, 200, 300);
  drawLetters();
  //If you get all letters letters reset
 if(LetterAmount <= 0){
    LetterAmount =+ 1*Multiplier;
  }
  //Display Score
  println(Time);
  fill(255);
  textAlign(CENTER);
  textSize(25);
  text("Score", 200, 395);
  text(Score, 200, 375);
  //Display Time
  text((TimeLimit - Time)/1000, 200, 20);
  text("TimeLimit", 200, 45);
  text(ExpectedScore, 350, 20);
  text("Task", 350, 45);
  //If score is below expected score, game over
  if (ExpectedScore - 5*Multiplier > Score){
  background(0);
  textSize(50);
  text("Game Over", 200, 200);
  //Restart game
  if(mousePressed){
    GameStart = false;
    ExpectedScore = 5;
    TimeLimit = ActualLimit + millis();
    Score = 0;
    Multiplier = 1;
  }
  
    }
  }
}


void drawLetters(){
  for (int i = letters.size()-1; i >= 0; i--) {
    Letter a = letters.get(i);
    a.display();
    if (a.kill()) {
      letters.remove(i);
      Score++;
    }
  }
}
    

class Letter {
  //Initialize positions for the letters
  
  
  float xpos;
  float ypos;
  float xspeed;
  char c;
  float sizeUp;
  
 
 Letter() {
  xpos = random(125, 275);
  ypos = random(75, 325);
  c = (char) int(random(33, 127));
}
  Letter(int Size) {
  sizeUp = sin(Size/10);
  xpos = random(125, 275);
  ypos = random(75, 325);
  c = (char) int(random(33, 127));
}

  void display() {
    
    rectMode(CORNER);
    stroke(0);
    fill(255);
    rect(xpos, ypos, 20 + sizeUp, 20 + sizeUp);
    fill(0);
    textSize(10 + sizeUp);
    textAlign(CENTER);
    text(c, xpos + 10, ypos + 13);
  }
  
    boolean kill() {
    if (mouseX > xpos && mouseX < xpos + 20 && mouseY > ypos && mouseY < ypos + 20 && mousePressed) {
      LetterAmount --;
      return true;
    }
    return false;
  }
}
