class Ship {
  int x, y, delay, cooldown;
  float size, speedX, speedY, boundSize;
  PShape ship;
  ArrayList<Bullet> magazine = new ArrayList<>();

  boolean killed;
  
  Ship(int _x, int _y, String _ship){
    this.x = _x;
    this.y = _y;
    this.ship = loadShape(_ship);
    this.cooldown = delay;
    this.killed = false;
  }
  
}
