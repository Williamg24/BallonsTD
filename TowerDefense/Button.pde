public class Button { //<>//
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

  public Button(String m, float x, float y, float w, float t, float curve, int cost) {
    xCor = x;
    yCor = y;
    wide = w;
    tall = t;
    radius = curve;
    money = cost;
    name = m;
    loadTowerImage();
  }

  public void loadTowerImage() {
    switch (money) {
    case 10:
      towerImage = loadImage("Tower1.png");
      break;
    case 20:
      towerImage= loadImage("Tower2.png");
      break;
    }
  }
  // buy menu icon for towers
  public void displayIcon() {
    fill(c);
    rect(xCor, yCor, wide, tall, radius);
    fill(textColor);
    text("$" + money, xCor + wide / 4, yCor + tall - 3);
    image(towerImage, xCor + wide/11, yCor + tall/8, 80, 80);
  }

  // displays for upgrades
  public void displayUpgrades() {
    stroke(0);
    fill(255);
    rect(xCor,yCor, wide, tall, radius);
    fill(0);
    textSize(30);
    text(name, xCor + wide / 4, height - 50);
    textSize(23);
    text("$" + money,xCor + wide / 3, height - 20);
  }

  // utility buttons like start, pause etc.
  public void display(color c) {
    fill(c);
    rect(xCor, yCor, wide, tall, radius);

    fill(255);
    textSize(32);
    text(name, xCor+80, yCor+35);
  }

  // check if mouse inside button
  boolean isInside(float x, float y) {
    return (x > xCor && x < xCor + wide && y > yCor && y < yCor + tall);
  }

  public void setColor(color x) {
    c = x;
  }

  public void enoughMoney(int value) {
    if (money <= value) {
      textColor = color(124, 252, 0);
    } else {
      textColor = #ff0000;
    }
  }
}
