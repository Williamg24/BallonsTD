public class Bloon {
  int type;
  float xCor;
  float yCor;
  float speed;     // how quickly t changes
  float t;
  
  public Bloon(int type_, float t_) {
    type = type_;
    xCor = 0;
    yCor = height/2;
    speed = 0.001 * (type + 1);       // go faster for higher types
    t = t_;
  }
  
  public void display() {
    fill(255,0,0);
    ellipse(xCor, yCor, 40,40);
  }
  
  public void move() {
    t += speed;
  }
  
  public float getT() {
    return t;
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
