public class Level1 extends Level{
  PImage mapImg;
  int[][] points = {{0,296}, {445,296}, {445,129}, {294,129}, {294,566}, {145,566}, {145,405}, {568,405}, {568,236}, {679,236}, {679,512}, {400,512}, {400,height}};
  
  public Level1() {
    super();
    mapImg = loadImage("Level1_map.jpg");
    
  }
  
  public void startAnimation() {
    for (int i=0; i<15; i++) {
      if (i % 5 == 0) {
        bloons.add(new Bloon(1,points[0][0] - (float) i * 70, points[0][1], points.length));
      }// else {
        bloons.add(new Bloon(0,points[0][0] - (float) i * 70, points[0][1], points.length));
      //}
    }
  }

  public void display() {
    displayPath();
    displayBloons();
    text("bloons length "+bloons.size(),10,40);
  }

  public void displayPath() {
    image(mapImg, 0, 0, MAP_WIDTH, height);
  }

  public void displayBloons() {
    Bloon b;
    int[] reference;
    int index;
    for (int i=0; i<bloons.size(); i++) {
      b = bloons.get(i);
      text("pointIndex: "+b.getPointIndex(), 10, 80);
      if (! b.isPopped()) {
        //b.move();
        index = b.getPointIndex();
        reference = points[index];
        b.setNewX(reference[0], findConstantX(index));
        b.setNewY(reference[1], findConstantY(index), index);
        b.display();
      } else {
        if (b.getT() > 1 || b.getPointIndex() >= points.length) {      // decrease health if bloon went off map
          health -= b.getDamage();
          //println(b.getDamage());
        } else {                 // a tower popped it
          money += b.worth();
        }
        bloons.remove(i);
        i--;
      }
    }
  }
  
  // finds out if x should be increased or decreased
  public int findConstantX(int index) {
    if (points[index][0] - points[index-1][0] > 0) {
       return 1;
    }
    return -1;
  }
  
  public int findConstantY(int index) {
    if (points[index][1] - points[index-1][1] > 0) {
       return 1;
    }
    return -1;
  }

  public boolean onPath(float x, float y) {
    return false;
  }
  
}
