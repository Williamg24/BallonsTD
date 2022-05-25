public class Sidebar {
  ArrayList<Button> buttons;
  Button start;

  public Sidebar() {
    buttons = new ArrayList<Button>();
    buttons.add(new Button("Basic", MAP_WIDTH + 20, 120, 100, 120, 28, 10));
    buttons.add(new Button("Advanced", MAP_WIDTH + 160, 120, 100, 120, 28, 20));
    
    start = new Button("Start", MAP_WIDTH + 20, height-80, 250, 50, 10, 0);
  }

  public void display() {
    fill(#b5651d);
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
    start.display(color(90, 190, 50));
  }
  public Button getButton(int index) {
    return buttons.get(index);
  }

  public boolean inSidebar(int x) {
    return (x >= MAP_WIDTH);
  }

  String findButtonName(int x, int y) {
    int index = 0;
    Button b;
    boolean done = false;
    while (!done && index < buttons.size()) {
      b = bar.getButton(index);
      if (b.isInside(x,y)){
        return b.name;
      }else{
        index++;
      }
    }
    b = start;
    if (b.isInside(x,y)){
       return b.name;
    }
    return "not selcted";
  }

}
