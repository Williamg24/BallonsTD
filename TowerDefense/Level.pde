public class Level {
  ArrayList<Bloon> bloons;
  
  public Level() {
    bloons = new ArrayList<Bloon>();
    for (int i=0; i<10; i++) {
      bloons.add(new Bloon(0,(float) i / 20-0.5));
    }
  }
  
  public void display() {
    displayBloons();
  }
  
  public void displayBloons() {
    for (Bloon b : bloons) {
      b.move();
      b.setX(pathFunctionX(b.getT()));
      b.setY(pathFunctionY(b.getT()));
      b.display();
    }
  }
  
  public float pathFunctionX(float t) {
    return t * MAP_WIDTH;
  }
  
  public float pathFunctionY(float t) {
    return height/2;
  }
}
