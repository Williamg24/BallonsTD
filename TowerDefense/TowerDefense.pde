int MAP_WIDTH = 900;
ArrayList<Tower> towers = new ArrayList<Tower>();

int money;
int health;
int currentBloon;
String type;
boolean animate;
Sidebar bar;
Level currentLevel;
Button selected;

void setup() {
  size(1200, 800);
  currentLevel = new Level();
  health = 5; 
  currentBloon = currentLevel.getSize() - 1;
  bar = new Sidebar();
  animate = false;
  money = 50;
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

// deal damage to bloons in tower range
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

// find Tower index that mouse is over
public int findTower(int xCor, int yCor) {
  int index = 0;
  Tower current;
  boolean done = false;
  while (! done && index < towers.size()) {
    current = towers.get(index);
    if (current.insideTower(xCor, yCor)) {
      return index;
    } else {
      index++;
    }
  }
  return -1;
}


void mouseClicked() {
  // only place tower if sufficient money for tower type selected and not on path
  if ((! currentLevel.onPath(mouseX, mouseY) && mouseX < MAP_WIDTH) && (selected != null) && (money >= selected.money)) {
    towers.add(new Tower(mouseX, mouseY, 1, 75, 50, selected.money, 60));
    money -= selected.money;
  }
  // select the type of tower
  if (bar.inSidebar(mouseX)) {
    if (bar.findButton(mouseX, mouseY) != null) {
      type = bar.findButton(mouseX, mouseY).name;
      selected = bar.findButton(mouseX, mouseY);
    }
    if (type.equals("Start") && ! animate) {
      //println("start the animation");
      currentLevel.startAnimation();
      animate = true;
    }
  }
}

void keyPressed() {
  // remove placed tower and refund money
  if (key == BACKSPACE) {
    Tower removed = towers.get(findTower(mouseX, mouseY));
    towers.remove(findTower(mouseX, mouseY));
    money += removed.getCost();
  }
}
