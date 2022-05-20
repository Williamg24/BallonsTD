int MAP_WIDTH = 1000;

int money;
int health;
int ticks;            // number of frames since animation started
Level currentLevel;

void setup() {
  size(1200,700);
  currentLevel = new Level();
}

void draw() {
  background(255);
  currentLevel.display();
}
