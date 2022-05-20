public class Bloon {
  int type;
  float xCor;
  float yCor;
  float speed;
  
  public Bloon() {
    this(0);
  }
  
  public Bloon(int type_) {
    type = type_;
    xCor = 0;
    yCor = height/2;
  }
  
  public void display() {
    ellipse(xCor, yCor, 40,40);
  }
}
