int MAP_WIDTH = 900;
ArrayList<Tower> towers = new ArrayList<Tower>();

int money;
int health;
//int currentBloon;
String type;
boolean animate;
Sidebar bar;
Level currentLevel;
Button selected;
Upgrades test;

void setup() {
  size(1200, 700);
  currentLevel = new Level1();
  health = 5;
  //currentBloon = currentLevel.getSize() - 1;
  bar = new Sidebar();
  animate = false;
  money = 50;
}

void draw() {
  background(90, 190, 50);     // the "grass"
  currentLevel.display();
  bar.display(money);
  for (Tower t1 : towers) {
    t1.display();
    if (t1.canAttack() && animate) {
      attackBloons(t1);
    }
  }

  // testing upgrades pop up
  if (selected != null) {
    test = new Upgrades(selected);
    test.display();
  }
  
  // visual test for onPath
  //fill(100,30,100,150);
  //noStroke();
  //for (int x = 0; x<width; x++) {
  //  for (int y = 0; y<height; y++) {
  //    if (currentLevel.onPath(x,y)) {
  //      ellipse(x,y,1,1);
  //    }
  //  }
  //}

  //text("mouseX: "+mouseX,10,20);
  //text("mouseY: "+mouseY,10,50);
  //text("frame rate: "+frameRate,10,100);
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
    towers.add(new Tower(type));
    money -= selected.money;
  }
  // select the type of tower
  if (bar.inSidebar(mouseX)) {
    if (bar.findButton(mouseX, mouseY) != null && bar.findButton(mouseX, mouseY) != selected) {
      type = bar.findButton(mouseX, mouseY).name;
      selected = bar.findButton(mouseX, mouseY);
    } else if (selected != null){
      selected.setColor(0);
      selected = null;
    }
    if (type != null && type.equals("Start")) {
      if (! animate) {
        currentLevel.startAnimation();
        animate = true;
      } else {
        animate = false;
      }
    }
  }
  updateButtons();
}

void keyPressed() {
  // remove placed tower and refund money
  if (key == BACKSPACE) {
    int index = findTower(mouseX, mouseY);
    if (index >= 0) {                        // only remove if tower exists
      Tower removed = towers.get(index);
      towers.remove(index);
      money += removed.getCost();
    }
  }
}

void updateButtons() {
  for (Button b : bar.buttons) {
    if (b != selected) {
      b.setColor(0);
    }
  }
}
