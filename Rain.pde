class Rain {
  
  float xpos;
  float ypos;
  
  
  
   Rain() {
  xpos = random(60, 340);
  ypos = random(30, 200);
   }
  
  
  
    void display() {
    fill(100, 100, 200);
    circle(xpos, ypos, 10);
  }
  void move() {
    ypos = ypos + 1;
    if (ypos > 225){
      ypos = 30;
    }
    
  }
  
}
