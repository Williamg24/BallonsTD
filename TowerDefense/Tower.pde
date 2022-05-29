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

  public Tower(String towerType) {
    switch (towerType) {
    case "Basic":
      towerSettings(mouseX, mouseY, 1, 75, 50, selected.money, 80, color(0));
      break;
    case "Advanced":
      towerSettings(mouseX, mouseY, 1, 100, 50, selected.money, 40, color(255));
      break;
    }
    loadTopView();
  }

  public void loadTopView() {
    switch(cost){
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
    image(TopView,x - Tsize/2,y - Tsize/2,Tsize,Tsize);
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
  public float getRange() {
    return range;
  }

  public int getDamage() {
    return damage;
  }

  public float getDelay() {
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
