int money;
int health;
Level currentLevel;

void setup() {
  size(1200,700);
  currentLevel = new Level();
}

void draw() {
  currentLevel.displayBloons();
}
