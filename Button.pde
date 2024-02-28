class Button {
  int x;
  int y;
  int l;
  int w;
  color startC;
  
  Button (int startX, int startY, int hors, int vert, color c){
    this.x = startX;
    this.y = startY;
    this.w = hors;
    this.l = vert;
    this.startC = c;
  }
  
  boolean within(){ //don't need parameters as mouseX and mouseY does this
    return (((x - w/2 < mouseX) && (mouseX < x + w/2)) && ((y - l/2 < mouseY) && (mouseY < y + l/2)));
  }
  
  void draw(){
    fill(startC);
    ellipse(x, y, w, l);
  }
}
