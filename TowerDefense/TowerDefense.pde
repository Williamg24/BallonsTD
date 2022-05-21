int MAP_WIDTH = 900;

int money;
int health;
int ticks;            // number of frames since animation started
Level currentLevel;
boolean animate;
ArrayList<Tower> towers = new ArrayList<Tower>();

void setup() {
  size(1200,700);
  currentLevel = new Level();
  health = 5; 
}

void draw() {
  background(90,190,50);     // the "grass"
  currentLevel.display();
  for (Tower t1 : towers){
    t1.display();
  }
}

void mouseClicked(){
  towers.add(new Tower(mouseX,mouseY,1,75,100));
}
