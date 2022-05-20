public class Level {
  ArrayList<Bloon> bloons;
  
  public Level() {
    bloons = new ArrayList<Bloon>();
    for (int i=0; i<10; i++) {
      bloons.add(new Bloon());
    }
  }
  
  public void displayBloons() {
    for (Bloon b : bloons) {
      b.display();
    }
  }
}
