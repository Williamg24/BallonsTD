int MAP_WIDTH = 900;

int money;
int health;
//int ticks;            // number of frames since animation started
Level currentLevel;
boolean animate;
ArrayList<Tower> towers = new ArrayList<Tower>();
int currentBloon;
Sidebar bar;

void setup() {
  size(1200, 800);
  currentLevel = new Level();
  health = 5; 
  currentBloon = currentLevel.getSize() - 1;
  bar = new Sidebar();
  
  //ticks = 0;
}

void draw() {
  background(90, 190, 50);     // the "grass"
  currentLevel.display();
  bar.display();
  for (Tower t1 : towers) {
    t1.display();
    // testing inRange & attack
    //if (currentBloon != -1) {
    //  if (t1.inRange(currentLevel.getBloon(currentBloon))) {
    //    t1.attack(currentLevel.getBloon(currentBloon));
    //    if (currentLevel.getBloon(currentBloon).isPopped()) {
    //      money+=10;
    //      currentBloon--;
    //    }
    //  }
    //}
    if (t1.canAttack()) {
      attackBloons(t1);
    }
  }
  //text("Money: " + money, 20, 20);
  //text("Index: " + currentBloon, 20, 40);
  //ticks++;
  //text("Ticks: " + ticks, 20, 60);
}

void attackBloons(Tower attacking) {
  for (Bloon b : currentLevel.bloons) {
    if (attacking.inRange(b)) {
      b.hit(attacking.getDamage());
      attacking.resetTicks();
    }
  }
}

void mouseClicked() {
  towers.add(new Tower(mouseX, mouseY, 1, 75, 100,200));
}
