public class Bloon {
  int type;
  float xCor;
  float yCor;
  float speed;     // how quickly t changes
  float t;
  int reward;      // how much money player earns if bloon is defeated

  public Bloon(int type_, float t_) {
    type = type_;
    xCor = 0;
    yCor = height/2;
    speed = 0.001 * (type + 1);       // go faster for higher types
    t = t_;
    reward = (type + 1) * 10;
  }

  public void display() {
    fill(255, 0, 0);
    ellipse(xCor, yCor, 40, 40);
  }

  public void move() {
    t += speed;
  }

  public float getT() {
    return t;
  }

  public int worth() {
    return reward;
  }

  public void hit(int damage) {
    type -= damage;
    speed -= 0.001;
  }

  public void setX(float x) {
    xCor = x;
  }

  public void setY(float y) {
    yCor = y;
  }

  public boolean isPopped() {
    return t > 1 || type < 0;
  }
}
