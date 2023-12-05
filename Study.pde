ArrayList<Letter> letters;
Rain[] drops = new Rain[64];

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
int RainDown;
int ColorText;

void setup(){
  size(400, 400);
    //Letter Arrays
    letters = new ArrayList<Letter>();
    TimeLimit =+ ActualLimit;
    LetterAmount = 1;
    ExpectedScore = 5;
    //Game starts on main menu
    GameStart = false;
    for(int i = 0; i < drops.length; i ++) {
      drops[i] = new Rain();
}
}

void draw() {
  background(75, 65, 50);
  if(GameStart == false){

    rectMode(CENTER);
    noStroke();
    //Background
    fill(90, 90, 110);
    rect(200, 125, 400, 250);
    fill(60, 60, 100);
    rect(200, 125, 300, 200);
//Rain
    for (int i = 0; i < drops.length; i++) {
      drops[i].display();
      drops[i].move();
      if(GameStart == true){
        break;
      }
    }

    //Body
    fill(100, 150, 100);
    ellipse(200, 240, 150, 200);
    
//Table
    fill(75, 65, 50);
    rect(200, 350, 300, 200);
    //Head and Hands
    fill(175, 150, 100);
    circle(200, 150, 100);
    circle(275, 250, 50);
    circle(125, 250, 50);
    //Eyes
    fill(0);
    rect(175, 150, 30, 10);
    rect(225, 150, 30, 10);
    //Hair
    ellipse(200, 115, 100, 50);
    ellipse(150, 150, 15, 75);
    ellipse(250, 150, 15, 75);
    triangle(200, 115, 250, 115, 250, 150);
    triangle(200, 115, 150, 115, 150, 150);
    
    fill(50, 100, 200, 200);
    ellipse(225, 165, 10, 15);
    //Text Study
    fill(255);
    textSize(50);
    text("Study", 200, 75);
    
    stroke(5);

    //Easy, Normal, Hard buttons
    fill(175);
    rect(200, 325, 100, 125);
       rectMode(CORNER);
    for (int y = 260; y < 390; y = y + 10){  
    for (int x = 300; x < 380; x = x + 10){
      rect(x, y, 10, 10);
    }
  }  
         rectMode(CENTER);
    fill(0);
    textSize(25);
    textAlign(CENTER);
    text("Easy", 200, 290);
    text("Normal", 200, 325);
    text("Hard", 200, 360);

    switch (ColorText){
          //Easy Mode is hovered over
      case 1:
      fill(0,255,0);
      text("Easy", 200, 290);
        if (mousePressed) {
      println(millis());
      GameStart = true;
      ActualLimit = 30000;
    }
      break;
          //Normal Mode is hovered over
      case 2:
      fill(255,255,0);
      text("Normal", 200, 325);
          if (mousePressed) {
      println(millis());
      GameStart = true;
      ActualLimit = 15000;
      
    }
      break;
      
      case 3:
          //Hard Mode is hovered over
      fill(255,0,0);
      text("Hard", 200, 360);
          if (mousePressed) {
      println(millis());
      GameStart = true;
      ActualLimit = 10000;
    }
      break;
    }
    //Easy Mode Check if mouse is hovering over
    if (dist(mouseX, mouseY, 200, 280) < 25) {
      ColorText = 1;
    }
    //Normal Mode Check if mouse is hovering over
    if (dist(mouseX, mouseY, 200, 325) < 25) {
      ColorText = 2;
    //Hard Mode Check if mouse is hovering over
    }
    if (dist(mouseX, mouseY, 200, 350) < 25) {
      ColorText = 3;
    }
  }
 //Game is true
  if(GameStart == true){

    //MAIN GAMEPLAY
  //Letter arrays are limited to the LetterAmount variable
  if (letters.size() < LetterAmount){
     letters.add(new Letter(Time)); 
  }
  
    Time =+ millis();
    //Time resets everytime it hits 0
  if(TimeLimit <= Time){
    Multiplier = Multiplier + 1;
    ExpectedScore = AddMultiplier(ExpectedScore);
    TimeLimit = ActualLimit + millis();
  }
    //Paper
    fill(175);
  rectMode(CENTER);
  rect(200, 200, 200, 300);
  
 //Letters on Paper
  drawLetters();
  //If you get all letters letters reset
 if(LetterAmount <= 0){
    LetterAmount =+ 1*Multiplier;
  }
  //Hand
  
  fill(100, 100, 0, 125);
  noStroke();
  triangle(mouseX, mouseY, mouseX + 40, mouseY + 75, mouseX + 60, mouseY + 75);
  fill(0, 0, 0, 100);
  circle(mouseX, mouseY, 10);
    fill(175, 150, 100, 240);
circle(mouseX+75, mouseY+100, 100);
fill(100, 150, 100);
triangle(mouseX + 100, mouseY + 60, mouseX + + + 100, mouseY + 140, 800, 800);

  //HUD and UI
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
// Function return type for expected score
int AddMultiplier(int Val){  
  Val = Val + 5*Multiplier;
  return Val;
}
