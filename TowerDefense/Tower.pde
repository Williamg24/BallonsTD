// damage, range, delay
int[][]originalStats = {{1, 75, 30}, {1, 100, 10}, {2, 1000, 25}, {1, 125, 15}};
int[][]towerData ={{1, 75, 30}, {1, 100, 10}, {2, 1000, 25}, {1, 125, 15}};

public class Tower {
  int cost;
  int range;
  int delay;
  int damage;
  int tick;
  int x;
  int y;
  int Tsize;
  PImage TopView;
  int type;
  float angle;

  public Tower(String towerType) {
    //println(Arrays.deepToString(towerData));
    switch (towerType) {
    case "Dart":
      type = 0;
      towerSettings(mouseX, mouseY, 50, 100);
      break;
    case "Ninja":
      type = 1;
      towerSettings(mouseX, mouseY, 50, 350);
      break;
    case "Sniper":
      type = 2;
      towerSettings(mouseX, mouseY, 50, 275);
      break;
    case "Sub":
      type = 3;
      towerSettings(mouseX, mouseY, 50, 225);
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
    //println("TopView" + (type+1) + ".png");
    TopView = loadImage("TopView" + (type+1) + ".png");
  }

  // sets the variables
  public void towerSettings(int xcor, int ycor, int tsize, int money) {
    x = xcor;
    y = ycor;
    damage = towerData[type][0];
    range = towerData[type][1];
    cost = money;
    delay = towerData[type][2];
    tick = delay;      // tower can start attacking right away
    Tsize = tsize;
  }

  public void display() {
    if (insideTower(mouseX, mouseY)) {// && mousePressed) {
      noFill();
      stroke(0);
      if (type == 2) {
        ellipse(x, y, Tsize * 2, Tsize * 2);
      } else {
        ellipse(x, y, range * 2, range * 2);
      }
    }

    faceAngle();
    tick++;
  }

  void resetTick() {      // tower needs to wait before attacking again
    tick = 0;
  }

  boolean canAttack() {
    return tick > delay;
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

  // need img so that only faces bloons in range of it instead of across whole map
  void faceBloon(Bloon b) {
    if (b != null) {
      pushMatrix();
      translate(x, y);
      angle = -atan2(b.xCor -x, b.yCor - y)+PI;
      rotate(angle);
      if(type == 3){
        image(TopView,-Tsize/2,-Tsize/2,68,68); 
      }else{
       image(TopView, -Tsize/2, -Tsize/2);
      }
      //fill(255,0,0);
      //rect(0, 0, 50, 2);
      popMatrix();
    }
  }

  Bloon firstInRange(Tower t) {
    Bloon b;
    int i = 0;
    boolean done = false;
    while (i < currentLevel.bloons.size() && ! done) {
      b = currentLevel.bloons.get(i);
      if (t.inRange(b)) {
        done = true;
        return b;
      }
      i++;
    }
    return null;
  }

  void faceAngle() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    if(type == 3){
     image(TopView,-Tsize/2,-Tsize/2,68,68); 
    }else{
     image(TopView, -Tsize/2, -Tsize/2);
    }
    popMatrix();
  }
}
