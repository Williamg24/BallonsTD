public class Upgrade {
  ArrayList<Button> upgradePaths; 
  int towerType;
  
  /* NOTE FOR SELF
  - Instead of ArrayList, maybe use 2-d arrays for each tower since need to be able to display next button after 
  first upgrade bought
  Ex: [Range][AtK speed]
      [Further Range][ATK dmg]
      [sees camo?][ATK penetration?] // even more upgrades if permitted
   - Maybe change start button to a play/pause button on top right)
   - If permitted, make screen size bigger? or use full screen -> have to change bloon path since cords will be diff and also the pics
  */
  //public Upgrade(Button b) {
  //  upgradePaths = new ArrayList<Button>();
  //  switch(b.name) {
  //  case "Basic":
  //    upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
  //    upgradePaths.add(new Button("ATK", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
  //    break;
  //  case "Advanced":
  //    upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
  //    upgradePaths.add(new Button("ATK", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
  //    break;
  //  }
  //}
  
  public Upgrade(String towerName) {
    upgradePaths = new ArrayList<Button>();
    switch(towerName) {
    case "Basic":
      upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
      upgradePaths.add(new Button("ATK", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
      towerType = 0;
      break;
    case "Advanced":
      upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
      upgradePaths.add(new Button("ATK", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
      towerType = 1;
      break;
    }
  }

  void display() {
    for (Button b : upgradePaths) {
      b.displayUpgrades();
    }
  }
  
  int getTowerType() {
    return towerType;
  }
  
  boolean inMenu(int x, int y){
    return ((x >= MAP_WIDTH) && (y >= height - 80));
  }
  
  Button selectUpgrade(int x, int y){
    int index = 0;
    Button b;
    boolean done = false;
    while (!done && index < upgradePaths.size()) {
      b = menu.upgradePaths.get(index);
      if (b.isInside(x, y)) {
        //b.setColor(#BEBEBE);
        return b;
      } else {
        index++;
      }
    }
    return null;
  }
}
