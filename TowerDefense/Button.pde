public class Button { //<>// //<>//
  PImage towerImage; 
  float xCor;
  float yCor;
  float wide;
  float tall;
  float radius;
  int money;
  String name;
  color c = 45;
  color textColor;
  int towerNum;

  public Button(String m, float x, float y, float w, float t, float curve, int cost) {
    xCor = x;
    yCor = y;
    wide = w;
    tall = t;
    radius = curve;
    money = cost;
    name = m;
    setupTower();
  }

  public void setupTower() {
    switch (money) {
    case 100:
      towerImage = loadImage("Tower1.png");
      towerNum = 0;
      break;
    case 350:
      towerImage= loadImage("Tower2.png");
      towerNum = 1;
      break;
    case 275:
      towerImage= loadImage("Tower3.png");
      towerNum = 2;
      break;
    case 225:
      towerImage= loadImage("Tower4.png");
      towerNum = 3;
      break;
    default:
      towerNum = -1;
    }
  }

  public boolean isTower() {
    return towerNum >= 0;
  }

  public int getTowerNum() {
    return towerNum;
  }

  // buy menu icon for towers
  public void displayIcon() {
    fill(c);
    rect(xCor, yCor, wide, tall, radius);
    fill(textColor);
    text("$" + money, xCor + wide / 4, yCor + tall - 3);
    if (towerImage != null) {
      image(towerImage, xCor + 15, yCor + 10, 110, 110);
    }
  }

  // displays for upgrades
  public void displayUpgrades() {
    stroke(0);
    fill(255);
    rect(xCor, yCor, wide, tall, radius);
    fill(0);
    textSize(30);
    text(name, xCor + wide / 5, height - 50);
    textSize(23);
    text("$" + money, xCor + wide / 3, height - 20);
  }

  // utility buttons like start, pause etc.
  public void display(color c) {
    fill(c);
    rect(xCor, yCor, wide, tall, radius);


    if (name.equals("Start")) {
      fill(255);
      textSize(32);
      text(name, xCor+80, yCor+35);
    } else if (name.equals("Menu")) {
      stroke(255);
      strokeWeight(4);
      line(xCor+10, yCor+15, xCor+wide-10, yCor+15);
      line(xCor+10, yCor+25, xCor+wide-10, yCor+25);
      line(xCor+10, yCor+35, xCor+wide-10, yCor+35);

      stroke(0);
      strokeWeight(1);
    } else if (name.equals("Skip Round")) {
      fill(255);
      textSize(20);
      text(name, xCor+5, yCor+30);
    }
  }

  // check if mouse inside button
  boolean isInside(float x, float y) {
    return (x > xCor && x < xCor + wide && y > yCor && y < yCor + tall);
  }

  public void setColor(color newColor) {
    c = newColor;
  }

  public void enoughMoney(int value) {
    if (money <= value) {
      textColor = color(124, 252, 0);
    } else {
      textColor = #ff0000;
    }
  }
}
