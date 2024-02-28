class EnemyShip extends Ship {
  boolean disappear;
  
  EnemyShip(int _x, int _y, String _ship) {
    super(_x, _y, _ship);
    this.speedX = 5;
    this.speedY = 1;
    this.size = 100;
    this.disappear = false;
    this.killed = false;
    this.delay = 150;
    this.boundSize = 75;
  }
  
   void fire(color c){
    if (cooldown == 0) {
      magazine.add(new Bullet(x, y, 0, 3, c)); // only fires downward
      cooldown = delay;
    }
    cooldown --;
  }

  void update() { // moves and checks for bullet removal
    for (Bullet bullet : magazine) {
      bullet.move();
      bullet.display();
    }
    
    for (int i = magazine.size() - 1; i >= 0; i--){
      Bullet bullet = magazine.get(i);
      if (bullet.disappear){
        magazine.remove(bullet);
      }
    }
  }
  
  void move() {
    float dx = random(-1, 1.2);  // Random movement along x-axis (-1, 0, or 1) NEED TO FIX JITTERY MOVEMENT
    float dy = 1;  // Move down along y-axis
    x += dx * speedX;
    y += dy * speedY;
    // to not move offscreen
    x = constrain(x, 0, width);
    if (y > height + 20){
      disappear = true;
    }
  }
  
  void display() {
    shapeMode(CENTER);
    shape(ship, x, y, size, size);
  }
}
