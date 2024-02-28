class PlayerShip extends Ship{
  PShape turret;
  float angle = 0;
  
  PlayerShip(int _x, int _y, String _ship, String turretFile){
    super(_x, _y, _ship);
    this.size = 100;
    this.speedX = 5;
    this.speedY = 5;
    this.delay = 10;
    this.boundSize = 90;
    turret = loadShape(turretFile);
  }
  
  void movement() { // make controls less annoying, when pressing keys, ship is hard to control
    if (key == 'w') {
      y -= speedY;
    }
    else if (key == 's') {
      y += speedY;
    }
    else if (key == 'a') {
      x -= speedX;
    }    
    else if (key == 'd') {
      x += speedX;
    }
    // stays on screen
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  void fire(color c){
    if (cooldown == 0) {
      float bulletSpeedX = 7 * cos(angle); //speed and direction
      float bulletSpeedY = 7 * sin(angle);
      magazine.add(new Bullet(x, y, bulletSpeedX, bulletSpeedY , c));
      cooldown = delay;
    }
    cooldown --;
  }

  void update() {
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
  
  void turretControl (){ //turret follows mouse
    angle = atan2(mouseY - y, mouseX - x);
  }
  
  void display() {
    pushMatrix();
    shapeMode(CENTER);
    shape(ship, x, y, size, size);
    translate(x, y);
    rotate(angle + PI/2);
    shape(turret, 0, 0, 100, 100);
    popMatrix();
  }
}
