public class Bloon {
  int type;
  float xCor;
  float yCor;
  float speed;     // how quickly t changes
  float t;
  int reward;      // how much money player earns if bloon is defeated
  int pointIndex;
  int maxPointIndex;
  int damage;
  PImage bloonImage;

  //public Bloon(int type_, float t_) {
  //  this(type_, 0, height/2,  1);
  //  t = t_;
  //}
  
  public Bloon(int type_, float[] coords, int maxPointIndex_) {
    this(type_ , coords[0], coords[1], maxPointIndex_);
  }

  public Bloon(int type_, float x, float y, int maxPointIndex_) {
    type = type_;
    xCor = x;
    yCor = y;
    speed = 0.005 + type * 0.0008;       // go faster for higher types
    reward = (type + 1) * 5;
    pointIndex = 1;
    maxPointIndex = maxPointIndex_;
    damage = type + 1;
    loadBloonImage();
  }

  public void loadBloonImage() {
    switch(type) {
    case 0:
      bloonImage = loadImage("Red_Bloon.png");
      break;
    case 1:
      bloonImage = loadImage("Blue_Bloon.png");
      break;
    }
  }

  public void display() {
    //fill(255, 0, 0);
    //println("display bloon");

    //fill(colors[type]);
    //ellipse(xCor, yCor, 40, 40);
    //getBloonType();
    image(bloonImage, xCor - 18, yCor - 18, 35, 40);
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

  public void hit(int hitNum) {
    type -= hitNum;
    speed -= 0.001;
    loadBloonImage();
  }

  public int getDamage() {
    return type+1;
  }

  public int getType() {
    return type;
  }

  public float getX() {
    return xCor;
  }

  public float getY() {
    return yCor;
  }

  //public void setX(float x) {
  //  xCor = x;
  //}

  //public void setY(float y) {
  //  yCor = y;
  //}
  
  // returns if position was changed or not
  public boolean setNewCoord(int[] aim) {
    float fracToCover;
    if (dist(xCor, yCor, aim[0], aim[1]) != 0) {
      fracToCover = speed * 3000 / dist(xCor, yCor, aim[0], aim[1]);
    } else {
      return false;
    }
    //text(fracToCover,10,height-30);
    float newX = xCor + fracToCover * (aim[0] - xCor);
    float newY = yCor + fracToCover * (aim[1] - yCor);
    
    if (dist(xCor, yCor, newX, newY) > dist(xCor, yCor, aim[0], aim[1])) {    // if new position overshoots the target coordinates
      //pointIndex++;
      return false;
    } else {
      xCor = newX;
      yCor = newY;
      return true;
    }
  }
  
  public void increasePointIndex() {
    pointIndex++;
  }

  public int getPointIndex() {
    return pointIndex;
  }

  public boolean isPopped() {
    return t > 1 || type < 0 || pointIndex >= maxPointIndex;
  }
}
