public class Sidebar {
  ArrayList<Button> buttons;

  public Sidebar() {
    buttons = new ArrayList<Button>();
    buttons.add(new Button("Basic", MAP_WIDTH + 20, 120, 100, 120, 28, 10));
  }

  public void display() {
    fill(255);
    rect(MAP_WIDTH, 0, width-MAP_WIDTH, height);

    fill(0);
    textSize(22);
    text("Money: "+money, MAP_WIDTH+20, 30);
    text("Health: "+health, MAP_WIDTH+20, 60);
    text("Tower Type: "+type, MAP_WIDTH+20, 90);
    displayButtons();
  }

  public void displayButtons() {
    for (Button b : buttons) {
      b.displayIcon();
    }
  }
  public Button getButton(int index) {
    return buttons.get(index);
  }
  
  public boolean inSidebar(int x){
    return (x >= MAP_WIDTH);
  }
}
