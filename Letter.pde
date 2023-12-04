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
