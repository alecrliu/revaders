class Bullet{
  int x, y;
  float size, speedX, speedY;
  boolean disappear;
  color c;
  
  Bullet(int startX, int startY, float _speedX, float _speedY, color _c){
    this.x = startX;
    this.y = startY;
    this.speedX = _speedX;
    this.speedY = _speedY;
    this.size = 15;
    this.disappear = false;
    this.c = _c;
  }
  
  void move() {
    x += speedX;
    y += speedY;
    if ((x > width) || (x < 0) || (y > height) || (y < 0)){ //remove if offscreen
      disappear = true;
    }
  }
  
  void display() {
    pushMatrix();
    fill(c);
    ellipse(x, y, size, size);
    popMatrix();
  }
}
