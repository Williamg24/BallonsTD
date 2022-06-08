int MAP_WIDTH = 900;
ArrayList<Tower> towers = new ArrayList<Tower>();

int MODE;
int money;
int health;
int levelselected;
int round;
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
  health = 100;
  //currentBloon = currentLevel.getSize() - 1;
  bar = new Sidebar();
  animate = false;
  money = 500;
  upgrades = new ArrayList<Upgrade>();
  upgrades.add(new Upgrade("Basic"));
  upgrades.add(new Upgrade("Advanced"));
  currentLevel = new Level(1);
  round = -1;
  
  //rprintln("hi");
}


void draw() { 
  switch(MODE) {
  case 0:
    startScreen();
    break;
  case 1:
    playScreen();
    menuButton.display(color(50, 150, 200));
    nextRound.display(color(20,130,150));
    break;
  }
  //background(90, 190, 50);     // the "grass"
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
  //map_select.add(new Button("MAP 1",50,200,525,425,0,0));
  //map_select.add(new Button("MAP 1",625,200,525,425,0,0));
  background(0);
  fill(255);
  textSize(75);
  text("SELECT A MAP TO BEGIN", 150, 125);
  image(MAP1, 50, 200, 525, 425);
  image(MAP2, 625, 200, 525, 425);
  //when the map is selected 
  menuButton = new Button("Menu", width - 70, 20, 50, 50, 5, 0);
  nextRound = new Button("Skip Round", MAP_WIDTH + 20, 400, 120, 50, 5, 0);
}

void playScreen() {
  currentLevel.display();
  //println();
  bar.display(money);
  for (Tower t1 : towers) {
    t1.display();
    if (t1.canAttack() && animate) {
      t1.faceBloon(t1.firstInRange(t1));
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

  //text("mouseX: "+mouseX,10,20);
  //text("mouseY: "+mouseY,10,50);
  //text("frame rate: "+frameRate,10,100);
  //text("Upgrade path: "+upgradeName, 10, 50);
  //text("selected button: "+selected, 10, 100);
  //if (selectedTower != null) {
  //  text("towerNum: "+selectedTower.getTowerNum(), 10, 140);
  //}
  //text("selectedTower: "+selectedTower, 10, 180);
  textSize(40);
  fill(#E3242B);
  text("Round:"+(round + 1) + "/" + bloonTypesInRound.length, MAP_WIDTH - 225, 50);
  //updateButtons();
}

void gameOverScreen() {
  background(0);
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
  //currentBloon = currentLevel.getSize() - 1;
  animate = false;
  money = 500;
  upgrades.clear();
  upgrades.add(new Upgrade("Basic"));
  upgrades.add(new Upgrade("Advanced"));
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
    if (attacking.inRange(b)) {
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
    if (mouseX >= 50 && mouseX <= 575 && mouseY >= 200 && mouseY <= 625) {
      levelselected = 1;
    } else if (mouseX >= 625 && mouseX <= 1150 && mouseY >= 200 && mouseY <= 625) {
      levelselected = 2;
    }
    //println(levelselected);
    if (levelselected > 0) {
      MODE = 1;
      currentLevel = new Level(levelselected);
      round = -1;
    }// else {
    //  MODE = 0;
    //}
  } else if (MODE == 2) {
    MODE = 0;
  } else {
    selected = bar.findButton(mouseX, mouseY);
    //println("mouse clicked");
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
      levelselected = 0;
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
  }// else if (selected != null) {
  //selected.setColor(0);
  //selected = null;
  //}
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
      }
      updateTowers();            // changes values for all towers, not just new ones
    }
    //upgradePath.setColor(#BEBEBE);
    //}
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
