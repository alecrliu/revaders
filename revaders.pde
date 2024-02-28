ArrayList<EnemyShip> enemyShips = new ArrayList<>();
int score = 0;
boolean starting = true;
float spawnTime; //spawning time
float cooldown;
PImage space;
PlayerShip player;


void setup() {
  size(1000, 900);
  space = loadImage("space.jpeg"); // TODO add stuff to background
  player = new PlayerShip(width/2, height - 100, "player.svg", "turret.svg");
  cooldown = spawnTime;
}


void draw() {
  if (starting){
    mainMenu();
  }
  else {
    if (!player.killed) {
      image(space, 0, 0);
      // Spawn a new enemy ship at a regular interval
      enemyBehavior();
      if (keyPressed) {
         player.movement();
      }
      if (mousePressed) {
         player.fire(color(0, 0, 255));
      }
        player.update();
        player.turretControl();
        player.display();
        //println(spawnTime); //for testing
      }
    else {
      gameOver();
    }
    
    fill(0, 255, 0);
    textAlign(LEFT);
    text("Score:", 0, 20);
    text(score, 70, 20);
  }
}


void enemyBehavior () {
  if (cooldown <= 0.0) {
    int startX = (int) random(width);      // Random starting x position
    enemyShips.add(new EnemyShip(startX, 0, "enemy.svg"));
    cooldown = spawnTime;
    spawnTime -= 1; // makes game progressively harder
  }

  // Update and display all enemy ships
  for (EnemyShip enemy : enemyShips) {
    enemy.move();
    enemy.fire(color(255, 0, 0));
    enemy.update();
    enemy.display();
    collision(enemy.magazine, player);
    collision(player.magazine, enemy);
  }
  
  for (int i = enemyShips.size() - 1; i >= 0; i--){ // controls removal of enemy ships
    EnemyShip eShip = enemyShips.get(i);
    if (eShip.disappear) { 
      enemyShips.remove(eShip);
      score -= 10;
    }
    else if (eShip.killed){
      score += 10;
      enemyShips.remove(eShip);
    }
  }
  cooldown --;
}


void collision(ArrayList<Bullet> ourMag, Ship theirShip) { //collision detection
  for (Bullet bullet : ourMag) {
      float part1 = (bullet.x - theirShip.x) * (bullet.x - theirShip.x);
      float part2 = (bullet.y - theirShip.y) * (bullet.y - theirShip.y);
      if (sqrt(part1 + part2) + 65 <= (bullet.size + theirShip.boundSize)){
        bullet.disappear = true;
        theirShip.killed = true;
      }
    }
}


void mainMenu(){
    image(space, 0, 0);
    pushMatrix();
    textSize(70);
    textAlign(CENTER);
    fill(154, 118, 255);
    text("Space Invaders: Low Budget Edition", width/4, height/4 - 40, width/2, height/2 - 40);
    Button easyButton = new Button(width/2, 2 * height/3, 100, 100, color(127, 191, 110));
    easyButton.draw();
    fill(255);
    textSize(25);
    text("Easy", width/2, 2 * height/3 + 10);
    Button hardButton = new Button(width/2, 100 + 3 * height/4, 100, 100, color(255, 0, 0));
    hardButton.draw();
    fill(255);
    textSize(25);
    text("Hard", width/2, 110 + 3 * height/4);
    if (mousePressed && easyButton.within()){
      starting = false;
      spawnTime = 100;
    }
    if (mousePressed && hardButton.within()){
      starting = false;
      spawnTime = 50;
    }
    popMatrix();
}


void gameOver() {
    image(space, 0, 0);
    pushMatrix();
    textSize(80);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("You are dead", width/4, height/4, width/2, height/2);
    
    Button saveButton = new Button(width/2, 2 * height/3, 100, 100, color(110, 191, 156));
    saveButton.draw();
    fill(255);
    textSize(20);
    text("Save score and exit", width/2, 2 * height/3 + 10);
    if (mousePressed && saveButton.within()){ // do score saving
      saveButton.startC = color(191, 133, 110);
      PrintWriter output = createWriter("score.txt"); 
      output.println("Score:");
      output.println(score);
      output.flush(); 
      output.close(); 
      exit();
    }
    
    Button closeButton = new Button(width/2, 3 * height/4 + 100, 100, 100, color(100, 100, 100));
    closeButton.draw();
    fill(255);
    textSize(25);
    text("Exit", width/2, 3 * height/4 + 110);
    if (mousePressed && closeButton.within()){ 
      exit();
    }
    popMatrix();
}
