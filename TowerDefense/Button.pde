public class Button {
  float xCor;
  float yCor;
  float wide;
  float tall;
  float radius;
  int money;
  String name;

  public Button(String m, float x, float y, float w, float t, float curve, int cost) {
    xCor = x;
    yCor = y;
    wide = w;
    tall = t;
    radius = curve;
    money = cost;
    name = m;
  }

  public void displayIcon() {
    fill(0);
    rect(xCor, yCor, wide, tall, radius);
    fill(255);
    text("$" + money, xCor + wide / 4, yCor + tall - 3);
  }

  public void display(color c) {
    fill(c);
    rect(xCor, yCor, wide, tall,radius);
    
    fill(255);
    textSize(32);
    text(name, xCor+80, yCor+35);
  }

  boolean isInside(float x, float y) {
    return (x > xCor && x < xCor + wide && y > yCor && y < yCor + tall);
  }
}
