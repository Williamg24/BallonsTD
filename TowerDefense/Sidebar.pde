public class Sidebar {
  ArrayList<Button> buttons;
  Button start;
  PImage moneypic = loadImage("money.png");
  PImage hp = loadImage("HP.png");

  public Sidebar() {
    buttons = new ArrayList<Button>();
    buttons.add(new Button("Basic", MAP_WIDTH + 20, 120, 100, 120, 28, 10));
    buttons.add(new Button("Advanced", MAP_WIDTH + 140, 120, 100, 120, 28, 20));

    start = new Button("Start", MAP_WIDTH + 20, 260, 250, 50, 10, 0);
  }

  public void display(int value) {
    fill(#e08b3e);
    rect(MAP_WIDTH, 0, width-MAP_WIDTH, height);

    fill(0);
    textSize(45);
    // Money Display
    image(moneypic,MAP_WIDTH+20,3,60,60);
    fill(#FFD700); // gold color for money text
    text(": "+money, MAP_WIDTH+80, 50);
    // HP Display
    image(hp,MAP_WIDTH+20,60,60,60);
    fill(#A91101); // red color for hp text
    text(": "+health, MAP_WIDTH+80, 105);
    //text("Tower Type: "+type, MAP_WIDTH+20, 90);
    textSize(23);
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
  /*
  public Button getButton(int index) {
    return buttons.get(index);
  }
*/
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
      b = bar.buttons.get(index);
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
