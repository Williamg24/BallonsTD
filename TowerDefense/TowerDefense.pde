int MAP_WIDTH = 900;

int money;
int health;
Level currentLevel;
boolean animate;
ArrayList<Tower> towers = new ArrayList<Tower>();
int currentBloon;
Sidebar bar;
String type;

void setup() {
  size(1200, 800);
  currentLevel = new Level();
  health = 5; 
  currentBloon = currentLevel.getSize() - 1;
  bar = new Sidebar();
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
      println("can attack");
      attackBloons(t1);
    }
  }
}

void attackBloons(Tower attacking) {
  Bloon b;
  int i = 0;
  boolean done = false;
  while (i < currentLevel.bloons.size() && ! done) {
    b = currentLevel.bloons.get(i);
    if (attacking.inRange(b)) {
      b.hit(attacking.getDamage());
      attacking.resetTick();
      done = true;
    }
    i++;
  }
}

void mouseClicked() {
  if (mouseX < MAP_WIDTH) {
    towers.add(new Tower(mouseX, mouseY, 1, 100, 100, 120, 50));
  }
  if (bar.inSidebar(mouseX)) {
    type = select(mouseX, mouseY);
  }
}

String select(int x, int y) {
  int i = 0;
  Button b;
  while (i < bar.buttons.size()) {
    b = bar.buttons.get(i);
    if (b.isInside(x, y) && mousePressed) {
      return b.name;
    } else {
      i++;
    }
  }
  return "not selected";
}
