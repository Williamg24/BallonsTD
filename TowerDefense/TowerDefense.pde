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

void mouseClicked() {
  if (! currentLevel.onPath(mouseX, mouseY) && mouseX < MAP_WIDTH) {
    towers.add(new Tower(mouseX, mouseY, 1, 75, 100, 30,50));
  }
  if (bar.inSidebar(mouseX)) {
    type = bar.findButtonName(mouseX, mouseY);
    if (type.equals("Start") && ! animate) {
      println("start the animation");
      currentLevel.startAnimation();
      animate = true;
    }
  }
}

public boolean isInside(int x, int y, Button b) {
  return (x <= b.xCor + b.wide) && ( x >= b.xCor - b.wide) && (y <= b.yCor + b.tall) && (y >= b.yCor - b.tall);
}
