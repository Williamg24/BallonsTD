public class Sidebar {
  
  public Sidebar() {
  }
  
  public void display() {
    fill(255);
    rect(MAP_WIDTH,0,width-MAP_WIDTH,height);
    
    fill(0);
    textSize(22);
    text("Money: "+money, MAP_WIDTH+20, 30);
    text("Health: "+health, MAP_WIDTH+20, 60);
  }
}
