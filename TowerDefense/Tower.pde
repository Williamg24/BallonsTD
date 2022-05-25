public class Tower {
  int cost;
  int range;
  int delay;
  int damage;
  int tick;
  float x;
  float y;
  int Tsize;

  public Tower(float xcor, float ycor, int atk, int radius, int money, int wait, int tsize) {
    x = xcor;
    y = ycor;
    damage = atk;
    range = radius;
    cost = money;
    delay = wait;
    tick = delay;      // tower can start attacking right away
    Tsize = tsize;
  }

  public void display() {
    if (mouseInside(mouseX, mouseY) && mousePressed) {
      noFill();
      stroke(0);
      ellipse(x, y, range * 2, range * 2);
    }
    fill(0);
    ellipse(x, y, Tsize, Tsize);
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

  public boolean mouseInside(int xCor, int yCor) {
    float d = dist(x, y, xCor, yCor);
    return d <= Tsize;
  }
  
  public int getTsize(){
    return Tsize;
  }
}
