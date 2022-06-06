int MAP_WIDTH = 900;
ArrayList<Tower> towers = new ArrayList<Tower>();

int money;
int health;
//int currentBloon;
String type;
boolean animate;
Sidebar bar;
Level currentLevel;
Button selected;
Upgrade menu;
Button selectedTower;

Button upgradePath;
String upgradeName;
ArrayList<Upgrade> upgrades;

void setup() {
  size(1200, 700);
  currentLevel = new Level1(1);
  health = 5;
  //currentBloon = currentLevel.getSize() - 1;
  bar = new Sidebar();
  animate = false;
  money = 500;
  upgrades = new ArrayList<Upgrade>();
  upgrades.add(new Upgrade("Basic"));
  upgrades.add(new Upgrade("Advanced"));
}

void draw() {
  background(90, 190, 50);     // the "grass"
  currentLevel.display();
  bar.display(money);
  for (Tower t1 : towers) {
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

  /*
  if (MouseInMenu()){
   menu.display();
   }
   */

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
  text("Upgrade path: "+upgradeName, 10, 50);
  text("selected button: "+selected, 10, 100);
  if (selectedTower != null){
    text("towerNum: "+selectedTower.getTowerNum(), 10, 140);
  }
  text("selectedTower: "+selectedTower, 10, 180);
  //updateButtons();
  
  
  if (health < 0){
    gameOverScreen();
  }
}

void gameOverScreen(){
  background(0);
  fill(255);
  textSize(100);
  text("GAME OVER", 300, 340);
  textSize(50);
  text("Click to Restart", 400, 400); 
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
  //println("mouse clicked");
  // only place tower if sufficient money for tower type selected and not on path
  if ((! currentLevel.onPath(mouseX, mouseY) && mouseX < MAP_WIDTH) && (selectedTower != null) && (money >= selectedTower.money)) {
    towers.add(new Tower(selectedTower.name));
    money -= selectedTower.money;
  }
  // select the type of tower
  if (bar.inSidebar(mouseX)) {
    if (bar.findButton(mouseX, mouseY) != null) {// && bar.findButton(mouseX, mouseY) != selected) {
      //type = bar.findButton(mouseX, mouseY).name;
      selected = bar.findButton(mouseX, mouseY);
      //println(selected.name);
      if (selected.isTower()) {
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
        //updateButtons();
        
      }
    } else if (selected != null) {
      //selected.setColor(0);
      selected = null;
    }

    if (selected != null && selected.name.equals("Start")){//type.equals("Start")) {
      if (! animate) {
        currentLevel.startAnimation();
        animate = true;
      } else {
        animate = false;
      }
    }
  }

  // test for upgrade menu
  if (menu != null && menu.inMenu(mouseX, mouseY)) {
    //if (menu.selectUpgrade(mouseX, mouseY) != upgradePath) {
      upgradePath = menu.selectUpgrade(mouseX, mouseY);
      upgradeName = upgradePath.name;
      if (money >= upgradePath.money) {
        money -= upgradePath.money;
        switch (upgradeName) {
          case "Range":
            towerData[menu.getTowerType()][1] += 20;
            //println(Arrays.deepToString(towerData));
            break;
        }
        updateTowers();            // changes values for all towers, not just new ones
      }
      //upgradePath.setColor(#BEBEBE);
    //}
  }
}

void updateTowers() {
  for (Tower t: towers) {
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

//void updateButtons() {
//  for (Button b : bar.towers) {
//    if (b == selectedTower) {
//      b.setColor(#BEBEBE);
//    }
//  }
//}

/*
boolean MouseInMenu(){
 return (menu != null && (mouseX >= MAP_WIDTH) && (mouseY >= height - 80));
 }
 */
