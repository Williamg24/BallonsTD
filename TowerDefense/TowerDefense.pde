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
  animate = false;
}

void draw() {
  background(90, 190, 50);     // the "grass"
  currentLevel.display();
  bar.display();
  for (Tower t1 : towers) {
    t1.display();
    if (t1.canAttack()) {
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

public int findTower(int xCor, int yCor) {
  int index = 0;
  Tower current;
  boolean done = false;
  while (! done && index < towers.size()) {
    current = towers.get(index);
    if (current.mouseInside(xCor, yCor)) {
      return index;
    } else {
      index++;
    }
  }
  return -1;
}


void mouseClicked() {
  if (! currentLevel.onPath(mouseX, mouseY) && mouseX < MAP_WIDTH) {
    towers.add(new Tower(mouseX, mouseY, 1, 75,50, 100, 60));
  }
  if (bar.inSidebar(mouseX)) {
    type = bar.findButtonName(mouseX, mouseY);
    if (type.equals("Start") && ! animate) {
      //println("start the animation");
      currentLevel.startAnimation();
      animate = true;
    }
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    Tower removed = towers.get(findTower(mouseX,mouseY));
    towers.remove(findTower(mouseX, mouseY));
    money += removed.getCost();
  }
}
