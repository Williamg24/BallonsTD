int MAP_WIDTH = 1200;

int money;
int health;
int ticks;            // number of frames since animation started
Level currentLevel;
boolean animate;
ArrayList<Tower> towers = new ArrayList<Tower>();
int currentBloon;

void setup() {
  // 1600 by 900
  size(2000, 1200);
  currentLevel = new Level();
  health = 5; 
  currentBloon = currentLevel.getSize() - 1;
}

void draw() {
  background(90, 190, 50);     // the "grass"
  currentLevel.display();
  for (Tower t1 : towers) {
    t1.display();
    // testing inRange & attack
    if (t1.inRange(currentLevel.bloons
    /*
    if (currentBloon != -1) {
      if (t1.inRange(currentLevel.getBloon(currentBloon))) {
        t1.attack(currentLevel.getBloon(currentBloon));
        if (currentLevel.getBloon(currentBloon).isPopped()) {
          money+=10;
          currentBloon--;
        }
      }
    }
    */
  }
  text("Money: " + money, 20, 20);
  text("Index: " + currentBloon, 20, 40);
}

void mouseClicked() {
  towers.add(new Tower(mouseX, mouseY, 1, 75, 100));
}

boolean checkRange(Tower t1, Bloon b1){
  float d = dist(b1.xCor,b1.yCor,t1.x,t1.y);
  return (d <= t1.getRange());
}
