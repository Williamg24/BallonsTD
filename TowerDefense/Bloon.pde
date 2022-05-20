public class Bloon {
  int type;
  float xCor;
  float yCor;
  float speed;
  float t;
  
  //public Bloon() {
  //  this(0);
  //}
  
  public Bloon(int type_, float t_) {
    type = type_;
    xCor = 0;
    yCor = height/2;
    speed = 0.01;
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
}
