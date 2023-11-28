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

void setup(){
  size(400, 400);
    //Letter Arrays
    letters = new ArrayList<Letter>();
    ActualLimit = 10000;
    TimeLimit =+ ActualLimit;
    LetterAmount = 10;
    ExpectedScore = 5;
}

void draw() {
  background(75, 65, 50);
  if(GameStart = true)

  
  if (letters.size() < LetterAmount){
     letters.add(new Letter(Time)); 
  }
  
    Time =+ millis();
  if(TimeLimit <= Time){
    ExpectedScore = ExpectedScore + 5;
    TimeLimit = ActualLimit + millis();
  }
    
  rectMode(CENTER);
  rect(200, 200, 200, 300);
  drawLetters();
 if(LetterAmount <= 0){
    LetterAmount =+ 10;
  }
  //Display of score
  println(Time);
  fill(255);
  textAlign(CENTER);
  textSize(25);
  text("Score", 200, 395);
  text(Score, 200, 375);
  text((TimeLimit - Time)/1000, 200, 20);
  text("TimeLimit", 200, 45);
  text(ExpectedScore, 350, 20);
  text("Task", 350, 45);
  
  if (ExpectedScore - 5 > Score){
  background(0);
  textSize(50);
  text("Game Over", 200, 200);
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
