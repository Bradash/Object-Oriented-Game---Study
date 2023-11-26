ArrayList<Letter> letters;


//Initialize Score
int Score;
boolean kill;
void setup(){
  size(400, 400);
    //Letter Arrays
    letters = new ArrayList<Letter>();
     
}

void draw() {
  background(75, 65, 50);
     letters.add(new Letter()); 
  rectMode(CENTER);
  rect(200, 200, 200, 300);
  for (int i = letters.size()-1; i >= 10; i--) {
    Letter a = letters.get(i);
    a.display();
    if (a.kill()) {
      letters.remove(i);
      Score++;
    }
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
    boolean kill() {
    if (mouseX > xpos && mouseX < xpos + 20 && mouseY > ypos && mouseY < ypos + 20 && mousePressed) {
      return true; // Signal that the letter should be removed
    }
    return false;
  }
}
