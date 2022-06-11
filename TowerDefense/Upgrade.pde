public class Upgrade {
  //ArrayList<Button> upgradePaths; 
  Button[] upgradePaths;
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

  //public Upgrade(String towerName) {
  //  upgradePaths = new ArrayList<Button>();
  //  switch(towerName) {
  //  case "Dart":
  //    upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
  //    upgradePaths.add(new Button("Atk Spd", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
  //    towerType = 0;
  //    break;
  //  case "Ninja":
  //    upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
  //    upgradePaths.add(new Button("Atk Spd", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
  //    towerType = 1;
  //    break;
  //  case "Sniper":
  //    upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
  //    upgradePaths.add(new Button("Atk Spd", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
  //    towerType = 2;
  //    break;
  //  case "Sub":
  //    upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
  //    upgradePaths.add(new Button("Atk Spd", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
  //    towerType = 3;
  //    break;
  //  }
  //}

  public Upgrade(String towerName) {
    upgradePaths = new Button[2];
    upgradePaths[0] = new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30);
    upgradePaths[1] = new Button("Atk Spd", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50);
    
    switch(towerName) {
    case "Dart":
      towerType = 0;
      break;
    case "Ninja":
      towerType = 1;
      break;
    case "Sniper":
      upgradePaths[0] = new Button("Damage", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 80);
      towerType = 2;
      break;
    case "Sub":
      towerType = 3;
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

  boolean inMenu(int x, int y) {
    return ((x >= MAP_WIDTH) && (y >= height - 80));
  }

  Button selectUpgrade(int x, int y) {
    int index = 0;
    Button b;
    boolean done = false;
    while (!done && index < upgradePaths.length) {
      b = menu.upgradePaths[index];
      if (b.isInside(x, y)) {
        return b;
      } else {
        index++;
      }
    }
    return null;
  }
}
