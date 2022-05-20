int MAP_WIDTH = 900;

int money;
int health;
int ticks;            // number of frames since animation started
Level currentLevel;

void setup() {
  size(1200,700);
  currentLevel = new Level();
  health = 5;
}

void draw() {
  background(255);
  currentLevel.display();
}
