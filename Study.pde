Letter[] letters = new Letter[100];
//Initialize Score
int Score;
boolean kill;

void setup(){
  size(400, 400);
  for (int i = 0; i < 99; i++) {
    //Letter Arrays
    letters[i] = new Letter();
  }
}

void draw() {
  background(75, 65, 50);
    
  rectMode(CENTER);
  rect(200, 200, 200, 300);
  for (int i = 0; i < 10; i++) {
    letters[i].display();
     letters[i].kill();
  }
  //Display of score
  println(Score);
  fill(255);
  textAlign(CENTER);
  textSize(25);
  text(Score, 200, 390);

  
}

class Letter {
  //Initialize positions for the letters
  float xpos = random(125, 275);
  float ypos = random(75, 325);
  float xspeed;
  char c = (char) int(random(33, 127));

  
  void display() {
    
    rectMode(CORNER);
    stroke(0);
    fill(255);
    rect(xpos, ypos, 20, 20);
    fill(0);
    textSize(10);
    text(c, xpos + 10, ypos + 13);
   
  }
    void kill() {
      //If the mouse is within the range of the area and mouse is pressed then the color changes and a point is added.
     if(mouseX > xpos && mouseX < xpos + 20 && mouseY > ypos && mouseY < ypos + 20 && mousePressed == true){
     rect(xpos, ypos, 20, 20);
     Score ++;
     }
  }
}
