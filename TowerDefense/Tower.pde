public class Tower {
  int cost;
  int range;
  float delay;
  int damage;
  int tick;
  
  public Tower(int atk, int radius){
    damage = atk;
    range = radius;
  }

  public void display() {
    
  }

  public void attack() {
  }
  
  public boolean inRange(){
    return false;
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
}
