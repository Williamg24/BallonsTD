color[] colors = {#FF0000, #00FA00, #0000FF};

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

  public Bloon(int type_, float t_) {
    this(type_, 0, height/2,  1);
    t = t_;
  }

  public Bloon(int type_, float x, float y, int maxPointIndex_) {
    type = type_;
    xCor = x;
    yCor = y;
    speed = 0.001 * (type + 1);       // go faster for higher types
    reward = (type + 1) * 10;
    pointIndex = 1;
    maxPointIndex = maxPointIndex_;
    damage = type + 1;
    loadBloonImage();
    //switch(type) {
    //case 0:
    //  bloonImage = loadImage("Red_Bloon.png");
    //  break;
    //case 1:
    //  bloonImage = loadImage("Blue_Bloon.png");
    //  break;
    //}
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
    return damage;
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

  public void setX(float x) {
    xCor = x;
  }

  public void setY(float y) {
    yCor = y;
  }

  public void setNewX(int aimX, int constant) {
    if (pointIndex % 2 != 1) {
      return;
    }
    float newX = xCor + speed*3000*constant;
    if (constant > 0) {
      if (newX > aimX) {
        pointIndex++;
      } else {
        xCor = newX;
      }
    } else {
      if (newX < aimX) {
        pointIndex++;
      } else {
        xCor = newX;
      }
    }
  }

  public void setNewY(int aimY, int constant, int index) {
    if (index % 2 != 0) {
      return;
    }
    float newY = yCor + speed*3000*constant;
    if (constant > 0) {
      if (newY > aimY) {
        pointIndex++;
      } else {
        yCor = newY;
      }
    } else {
      if (newY < aimY) {
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
    return t > 1 || type < 0 || pointIndex >= maxPointIndex;
  }
}
