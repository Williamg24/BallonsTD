public class Tower {
  int cost;
  int range;
  float delay;
  int damage;
  int tick;
  float x;
  float y;
  
  public Tower(float xcor, float ycor, int atk, int radius, int money){
    x = xcor;
    y = ycor;
    damage = atk;
    range = radius;
    cost = money;
  }

  public void display() {
    noFill();
    stroke(0);
    ellipse(x,y,range * 2,range * 2);
    fill(0);
    ellipse(x,y,50,50);
  }

  public void attack(Bloon current) {
    current.type -= damage;
  }
  // radius around tower
  public boolean inRange(Bloon value){
    float distance = dist(x,y,value.xCor,value.yCor);
    return (distance <= range);
  }
  public float getRange(){
    return range;
  }

  public int getDamage() {
    return damage;
  }

  public float getDelay() {
    return delay;
  }
  
  public int getCost(){
    return cost;
  }
}
