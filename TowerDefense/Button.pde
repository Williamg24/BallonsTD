public class Button {
  float xCor;
  float yCor;
  float wide;
  float tall;
  float radius;
  int money;
  String name;

  public Button(String m, float x, float y, float w, float t,float curve,int cost) {
    xCor = x;
    yCor = y;
    wide = w;
    tall = t;
    radius = curve;
    money = cost;
    name = m;
  }
  
  public void displayIcon(){
    rect(xCor,yCor,wide,tall,radius);
    fill(255);
    text("$" + money,xCor + wide / 4,yCor + tall - 3);
  }
  
  public void display(){
   rect(xCor,yCor,wide,tall);
  }
  
  
}
