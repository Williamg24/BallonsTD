public class Bloon {
  int type;
  float xCor;
  float yCor;
  float speed;     // how quickly t changes
  float t;
  int reward;      // how much money player earns if bloon is defeated
  int pointIndex;

  public Bloon(int type_, float t_) {
    type = type_;
    xCor = 0;
    yCor = height/2;
    speed = 0.001 * (type + 1);       // go faster for higher types
    t = t_;
    reward = (type + 1) * 10;
    pointIndex = 0;
  }
  
  public Bloon(int type_, float t_, float x, float y) {
    type = type_;
    xCor = x;
    yCor = y;
    speed = 0.001 * (type + 1);       // go faster for higher types
    t = t_;
    reward = (type + 1) * 10;
    pointIndex = 1;
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
  
  public float getSpeed() {
    return speed;
  }

  public int worth() {
    return reward;
  }

  public void hit(int damage) {
    type -= damage;
    speed -= 0.001;
  }
  
  public float getX() {
    return xCor;
  }

  public float getY() {
    return yCor;
  }

  public void setX(float x) {
    xCor = x;
  }

  public void setY(float y) {
    yCor = y;
  }
  
  public void setNewX(int aimX, int constant) {
    if (pointIndex % 2 == 1) {
      float newX = xCor + speed*2000*constant;
      if (newX > aimX) {
        pointIndex++;
      } else {
        xCor = newX;
      }
    }
  }

  public void setNewY(int aimY, int constant) {
    if (pointIndex % 2 == 0) {
      float newY = yCor + speed*2000*constant;
      if (newY > aimY) {
        pointIndex++;
      } else {
        yCor = newY;
      }
    }
  }
  
  //public void incrementPointIndex() {
  //  pointIndex++;
  //}
  
  public int getPointIndex() {
    return pointIndex;
  }

  public boolean isPopped() {
    return t > 1 || type < 0;
  }
}
