public class Button {
  float xCor;
  float yCor;
  float wide;
  float tall;
  float radius;
  int money;
  String name;
  color c = 0;
  color textColor;

  public Button(String m, float x, float y, float w, float t, float curve, int cost) {
    xCor = x;
    yCor = y;
    wide = w;
    tall = t;
    radius = curve;
    money = cost;
    name = m;
  }

  // buy menu icon for towers
  public void displayIcon() {
    fill(c);
    rect(xCor, yCor, wide, tall, radius);
    fill(textColor);
    text("$" + money, xCor + wide / 4, yCor + tall - 3);
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
  
  public void setColor(color x){
    c = x;
  }
  
  public void enoughMoney(int value){
    if (money <= value){
      textColor = color(124,252,0);
    }else {
      textColor = #ff0000;
    }
  }
}
