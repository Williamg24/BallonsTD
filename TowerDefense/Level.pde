public class Level {
  ArrayList<Bloon> bloons;
  
  public Level() {
    bloons = new ArrayList<Bloon>();
    for (int i=0; i<10; i++) {
      bloons.add(new Bloon(0,(float) i / 10-0.5));
    }
  }
  
  public void display() {
    displayPath();
    displayBloons();
  }
  
  public void displayPath() {
    fill(250,234,180);
    noStroke();
    rect(0, height/2 - 40, MAP_WIDTH, 80);
  }
  
  public void displayBloons() {
    Bloon b;
    for (int i=0; i<bloons.size(); i++) {
      b = bloons.get(i);
      if (! b.isPopped()){
        b.move();
        b.setX(pathFunctionX(b.getT()));
        b.setY(pathFunctionY(b.getT()));
        b.display();
      } else {
        if (b.getT() > 1) {      // decrease health if bloon went off map
          health--;
        }
        bloons.remove(i);
        i--;
      }
    }
  }
  
  public float pathFunctionX(float t) {
    return t * MAP_WIDTH;
  }
  
  public float pathFunctionY(float t) {
    return height/2;
  }
}
