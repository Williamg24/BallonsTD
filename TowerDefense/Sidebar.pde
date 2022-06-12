public class Sidebar {
  ArrayList<Button> towerButtons;
  Button start;
  Button nextRound;
  PImage moneyPic = loadImage("money.png");
  PImage hp = loadImage("HP.png");

  public Sidebar() {
    towerButtons = new ArrayList<Button>();
    towerButtons.add(new Button("Dart", MAP_WIDTH + 10, 130, (width-MAP_WIDTH)/2 - 15, 150, 28, 100));
    towerButtons.add(new Button("Ninja", MAP_WIDTH +(width-MAP_WIDTH)/2 + 10, 130, (width-MAP_WIDTH)/2 -15, 150, 28, 350));
    towerButtons.add(new Button("Sniper", MAP_WIDTH + 10, 290, (width-MAP_WIDTH)/2 - 15, 150, 28, 275));
    towerButtons.add(new Button("Sub", MAP_WIDTH +(width-MAP_WIDTH)/2 + 10, 290, (width-MAP_WIDTH)/2 -15, 150, 28, 225));

    start = new Button("Start", MAP_WIDTH + 25, 465, 250, 50, 10, 0);
  }

  public void display(int value) {
    fill(#e08b3e);
    rect(MAP_WIDTH, 0, width-MAP_WIDTH, height);

    fill(0);
    textSize(45);
    
    // Money Display
    image(moneyPic, MAP_WIDTH+20, 3, 60, 60);
    fill(#FFD700); // gold color for money text
    text(": "+money, MAP_WIDTH+80, 50);
    
    // HP Display
    image(hp, MAP_WIDTH+20, 60, 60, 60);
    fill(#A91101); // red color for hp text
    text(": "+health, MAP_WIDTH+80, 105);
    //text("Tower Type: "+type, MAP_WIDTH+20, 90);
    textSize(30);
    displayButtons(value);
  }

  public void displayButtons(int x) {
    for (Button b : towerButtons) {
      b.displayIcon();
      b.enoughMoney(x);
    }
    if (animate) {
      start.display(color(70, 160, 40));      // dim button if already clicked
    } else {
      start.display(color(90, 190, 50));
    }
    //nextRound.display(color(0,0,200));
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
    while (!done && index < towerButtons.size()) {
      b = bar.towerButtons.get(index);
      if (b.isInside(x, y)) {
        //b.setColor(#BEBEBE);
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
