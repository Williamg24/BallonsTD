// damage, range, delay
int[][]towerData ={{1, 75, 80}, {1, 100, 40}};

public class Tower {
  int cost;
  int range;
  int delay;
  int damage;
  int tick;
  int x;
  int y;
  int Tsize;
  color towerColor;
  PImage TopView;
  int type;

  public Tower(String towerType) {
    switch (towerType) {
    case "Basic":
      type = 0;
      towerSettings(mouseX, mouseY, 1, 75, 50, 10, 80, color(0));
      break;
    case "Advanced":
      type = 1;
      towerSettings(mouseX, mouseY, 1, 100, 50, 20, 40, color(255));
      break;
    }
    loadTopView();
  }
  
  public void update() {
    damage = towerData[type][0];
    range = towerData[type][1];
    delay = towerData[type][2];
  }

  public void loadTopView() {
    switch(cost) {
    case 10:
      TopView = loadImage("TopView1.png");
      break;
    case 20:
      TopView = loadImage("TopView2.png");
      break;
    }
  }

  // sets the variables
  public void towerSettings(int xcor, int ycor, int atk, int radius, int tsize, int money, int wait, color c) {
    x = xcor;
    y = ycor;
    damage = atk;
    range = radius;
    cost = money;
    delay = wait;
    tick = delay;      // tower can start attacking right away
    Tsize = tsize;
    towerColor = c;
  }

  public void display() {
    if (insideTower(mouseX, mouseY)) {// && mousePressed) {
      noFill();
      stroke(0);
      ellipse(x, y, range * 2, range * 2);
    }
    //fill(towerColor);
    //ellipse(x, y, Tsize, Tsize);
    if (TopView != null) {
      image(TopView, x - Tsize/2, y - Tsize/2, Tsize, Tsize);
    }
    tick++;
  }

  void resetTick() {      // tower needs to wait before attacking again
    tick = 0;
  }

  boolean canAttack() {
    return tick > delay;
  }

  public void attack(Bloon current) {
    current.type -= damage;
  }

  // radius around tower
  public boolean inRange(Bloon value) {
    float distance = dist(x, y, value.xCor, value.yCor);
    return (distance <= range);
  }
  public int getRange() {
    return range;
  }

  public int getDamage() {
    return damage;
  }

  public int getDelay() {
    return delay;
  }

  public int getCost() {
    return cost;
  }

  // check if mouseinside tower
  public boolean insideTower(int xCor, int yCor) {
    float d = dist(x, y, xCor, yCor);
    return d <= Tsize;
  }

  public int getTsize() {
    return Tsize;
  }
}
