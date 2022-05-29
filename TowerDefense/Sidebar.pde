public class Sidebar {
  ArrayList<Button> buttons;
  Button start;

  public Sidebar() {
    buttons = new ArrayList<Button>();
    buttons.add(new Button("Basic", MAP_WIDTH + 20, 120, 100, 120, 28, 10));
    buttons.add(new Button("Advanced", MAP_WIDTH + 140, 120, 100, 120, 28, 20));

    start = new Button("Start", MAP_WIDTH + 20, height-80, 250, 50, 10, 0);
  }

  public void display(int value) {
    fill(#e08b3e);
    rect(MAP_WIDTH, 0, width-MAP_WIDTH, height);

    fill(0);
    textSize(22);
    text("Money: "+money, MAP_WIDTH+20, 30);
    text("Health: "+health, MAP_WIDTH+20, 60);
    text("Tower Type: "+type, MAP_WIDTH+20, 90);
    displayButtons(value);
  }

  public void displayButtons(int x) {
    for (Button b : buttons) {
      b.displayIcon();
      b.enoughMoney(x);
    }
    if (animate) {
      start.display(color(70, 160, 40));      // dim button if already clicked
    } else {
      start.display(color(90, 190, 50));
    }
  }
  public Button getButton(int index) {
    return buttons.get(index);
  }

  // check if mouse inside Sidebar
  public boolean inSidebar(int x) {
    return (x >= MAP_WIDTH);
  }

  // finds button at mouse location
  Button findButton(int x, int y) {
    int index = 0;
    Button b;
    boolean done = false;
    while (!done && index < buttons.size()) {
      b = bar.getButton(index);
      if (b.isInside(x, y)) {
        b.setColor(#BEBEBE);
        return b;
      } else {
        index++;
      }
    }
    b = start;
    if (b.isInside(x, y)) {
      return b;
    }
    return null;
  }
}
