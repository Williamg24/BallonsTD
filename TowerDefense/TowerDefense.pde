import java.util.*;

int MAP_WIDTH = 900;
ArrayList<Tower> towers = new ArrayList<Tower>();

int MODE;
int money;
int health;
int levelSelected;
int round;            // original value is -1 to offset increment
String type;
boolean animate;
Sidebar bar;
Level currentLevel;
Button selected;
Upgrade menu;
Button selectedTower;
Button menuButton;
Button nextRound;

Button upgradePath;
String upgradeName;
ArrayList<Upgrade> upgrades;

void setup() {
  size(1200, 700);
  MODE = 0;
  health = 5;
  bar = new Sidebar();
  animate = false;
  money = 500;
  upgrades = new ArrayList<Upgrade>();
  upgrades.add(new Upgrade("Dart"));
  upgrades.add(new Upgrade("Ninja"));
  upgrades.add(new Upgrade("Sniper"));
  upgrades.add(new Upgrade("Sub"));
  currentLevel = new Level(1);
  round = -1;
}


void draw() { 
  switch(MODE) {
  case 0:
    startScreen();
    break;
  case 1:
    playScreen();
    menuButton.display(color(50, 150, 200));
    nextRound.display(color(20, 130, 150));
    break;
  }

  if (health < 0) {
    gameOverScreen();
    MODE = 2;
  }
  //text("currentLevel: "+currentLevel.getType(), 10, height-30);
  //text("MODE: "+MODE, 10, height-10);
}

void startScreen() {
  PImage MAP1 = loadImage("Level1_map.jpg");
  PImage MAP2 = loadImage("Level2_map.jpg");
  PImage MAP3 = loadImage("Level3_map.jpg");
  background(0);
  fill(255);
  textSize(80);
  text("SELECT A MAP TO BEGIN", 150, 150);
  image(MAP1, 40, 200, 360, 300);
  image(MAP2, 420, 200, 360, 300);
  image(MAP3, 800, 200, 360, 300);
  
  //when the map is selected 
  menuButton = new Button("Menu", width - 70, 20, 50, 50, 5, 0);
  nextRound = new Button("Skip Round", MAP_WIDTH + 90, 525, 120, 50, 5, 0);
}

void playScreen() {
  currentLevel.display();
  bar.display(money);
  for (Tower t1 : towers) {
    t1.faceBloon(t1.firstInRange(t1));
    t1.display();
    if (t1.canAttack() && animate) {
      attackBloons(t1);
    }
  }

  // testing upgrades pop up
  //if (selected != null) {
  if (selectedTower != null) {
    //menu = upgrades.get(selectedTower.getTowerNum());//new Upgrade(selected);
    menu.display();
  } else {
    menu = null;
  }

  //// visual test for onPath
  //fill(100,30,100,150);
  //noStroke();
  //for (int x = 0; x<width; x++) {
  //  for (int y = 0; y<height; y++) {
  //    if (currentLevel.onPath(x,y)) {
  //      ellipse(x,y,1,1);
  //    }
  //  }
  //}

  textSize(40);
  fill(255);
  text("Round:"+(round + 1) + "/" + bloonTypesInRound.length, MAP_WIDTH - 270, 50);
}

void gameOverScreen() {
  background(170, 0, 0);
  fill(255);
  textSize(100);
  text("GAME OVER", 300, 340);
  textSize(50);
  text("Click to Restart", 400, 400);
  restart();
}

void restart() {
  round = -1;
  MODE = 0;
  health = 5;
  animate = false;
  money = 500;
  upgrades.clear();
  upgrades.add(new Upgrade("Dart"));
  upgrades.add(new Upgrade("Ninja"));
  upgrades.add(new Upgrade("Sub"));
  upgrades.add(new Upgrade("Sniper"));
  currentLevel = new Level(1);
  towers.clear();
  towerData = Arrays.copyOf(originalStats, originalStats.length);
  selected = null;
}

// deal damage to bloons in tower range
void attackBloons(Tower attacking) {
  Bloon b;
  int i = 0;
  boolean done = false;
  while (i < currentLevel.bloons.size() && ! done) {
    b = currentLevel.bloons.get(i);
    if (attacking.inRange(b) && b.canBeAttacked()) {
      b.hit(attacking.getDamage());
      attacking.resetTick();
      done = true;
    }
    i++;
  }
}

// find Tower index that mouse is over
public int findTower(int xCor, int yCor) {
  int index = 0;
  Tower current;
  boolean done = false;
  while (! done && index < towers.size()) {
    current = towers.get(index);
    if (current.insideTower(xCor, yCor)) {
      return index;
    } else {
      index++;
    }
  }
  return -1;
}

void mouseClicked() {
  if (MODE == 0) {
    //selecting level
    if (mouseX >= 40 && mouseX <= 40 + 360 && mouseY >= 200 && mouseY <= 500) {
      levelSelected = 1;
    } else if (mouseX >= 420 && mouseX <= 420 + 360 && mouseY >= 200 && mouseY <= 500) {
      levelSelected = 2;
    } else if (mouseX >= 800 && mouseX <= 800 + 360 && mouseY >= 200 && mouseY <= 500) {
      levelSelected = 3;
    }
    //println(levelSelected);
    if (levelSelected > 0) {
      MODE = 1;
      currentLevel = new Level(levelSelected);
      round = -1;
    }
  } else if (MODE == 2) {
    MODE = 0;
  } else {
    selected = bar.findButton(mouseX, mouseY);

    // only place tower if sufficient money for tower type selected and not on path
    if ((! currentLevel.onPath(mouseX, mouseY) && mouseX < MAP_WIDTH) && (selectedTower != null) && (money >= selectedTower.money)) {
      towers.add(new Tower(selectedTower.name));
      money -= selectedTower.money;
    }
    if (bar.inSidebar(mouseX)) {
      checkTowers();
    }
    checkForUpgrades();

    if (selected != null && selected.name.equals("Start")) {//type.equals("Start")) {
      if (! animate) {
        currentLevel.startAnimation();
        animate = true;
      } else {
        animate = false;
      }
    }

    if (nextRound.isInside(mouseX, mouseY)) {
      currentLevel.clearBloons();              // this will trigger the next round
    }

    if (menuButton.isInside(mouseX, mouseY)) {
      MODE = 0;
      round = -1;
      animate = false;
      towers.clear();
      levelSelected = 0;
      //currentLevel = null;
    }
  }
}

// select the type of tower
void checkTowers() {
  if (selected != null && selected.isTower()) {// && bar.findButton(mouseX, mouseY) != selected) {
    //println(selected.name);
    if (selected.equals(selectedTower)) {
      selectedTower.setColor(color(0));
      selected = null;
      selectedTower = null;
    } else {
      if (selectedTower != null) {
        selectedTower.setColor(color(0));
      }
      selectedTower = selected;
      selected.setColor(#BEBEBE);
      menu = upgrades.get(selectedTower.getTowerNum());
    }
  }
}

void checkForUpgrades() {
  // test for upgrade menu
  if (menu != null && menu.inMenu(mouseX, mouseY)) {
    //if (menu.selectUpgrade(mouseX, mouseY) != upgradePath) {
    upgradePath = menu.selectUpgrade(mouseX, mouseY);
    upgradeName = upgradePath.name;
    if (money >= upgradePath.money) {
      money -= upgradePath.money;
      upgradePath.money += 10;
      switch (upgradeName) {
      case "Range":
        towerData[menu.getTowerType()][1] += 20;
        //println(Arrays.deepToString(towerData));
        break;
      case "ATK Speed":
        towerData[menu.getTowerType()][2] *= 0.8;
        break;
      case "Damage":
        towerData[menu.getTowerType()][0] = (towerData[menu.getTowerType()][0] + 10) * 2;
        break;
      }
      updateTowers();            // changes values for all towers, not just new ones
    }
  }
}

void updateTowers() {
  for (Tower t : towers) {
    t.update();
  }
}

void keyPressed() {
  // remove placed tower and refund money
  if (key == BACKSPACE) {
    int index = findTower(mouseX, mouseY);
    if (index >= 0) {                        // only remove if tower exists
      Tower removed = towers.get(index);
      towers.remove(index);
      money += removed.getCost();
    }
  }
}
