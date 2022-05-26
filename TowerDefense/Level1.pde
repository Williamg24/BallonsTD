public class Level1 extends Level{
  PImage mapImg;
  int[][] points = {{0,296}, {445,296}, {296,131}, {294,131}, {294,566}, {145,566}, {145,405}, {565,405}, {566,236}, {679,236}, {679,508}, {400,height},};
  
  public Level1() {
    super();
    mapImg = loadImage("Level1_map.jpg");
    
  }
  
  public void startAnimation() {
    for (int i=0; i<10; i++) {
      bloons.add(new Bloon(0, (float) i * -0.08));
    }
  }

  public void display() {
    displayPath();
    displayBloons();
  }

  public void displayPath() {
    image(mapImg, 0, 0, MAP_WIDTH, height);
  }
  
  public float pathFunctionX(float t) {
    return t * MAP_WIDTH;
  }
  
  public float pathFunctionY(float t) {
    return height/2;
  }

  public boolean onPath(float x, float y) {
    return (y > height/2 - 40 && y < height/2 + 40 && x > 0 && x < MAP_WIDTH);
  }
  
}
