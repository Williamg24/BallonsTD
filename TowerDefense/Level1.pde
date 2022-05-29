public class Level1 extends Level{
  PImage mapImg;
  int[][] points = {{0,296}, {445,296}, {445,129}, {294,129}, {294,566}, {145,566}, {145,405}, {568,405}, {568,236}, {679,236}, {679,512}, {400,512}, {400,height}};

  public Level1() {
    super();
    mapImg = loadImage("Level1_map.jpg");

  }

  public void startAnimation() {
    if (bloons.size() == 0) {
      for (int i=0; i<20; i++) {
        if (i % 5 == 0) {
          bloons.add(new Bloon(1,points[0][0] - (float) i * 70, points[0][1], points.length));
        }
         bloons.add(new Bloon(0,points[0][0] - (float) i * 70, points[0][1], points.length));
      }
    }
  }
  
  public void swapOrder(int index) {
    Bloon b = bloons.get(index);
    Bloon prev = bloons.get(index-1);
    int pIndex1 = b.getPointIndex();
    int pIndex2 = prev.getPointIndex();
    
    if (pIndex1 > pIndex2) {
      bloons.remove(index);
      bloons.add(index-1,b);
    } else if (pIndex1 == pIndex2){
      int aimX = points[pIndex1][0];
      int aimY = points[pIndex1][1];
      if (dist(b.getX(),b.getY(),aimX,aimY) > dist(prev.getX(),prev.getY(),aimX,aimY)) {
         bloons.remove(index);
         bloons.add(index-1,b);
      }
    }
  }

  public void display() {
    displayPath();
    if (animate) {
      displayBloons();
    } else {
      displayStillBloons();
    }
    text("bloons length: "+bloons.size(),10,40);
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
        
        if (i > 0 && b.getType() > 0) {
          swapOrder(i);
        }
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
  
  public void displayStillBloons() {
    Bloon b;
    for (int i=0; i<bloons.size(); i++) {
      b = bloons.get(i);
      b.display();
      text("pointIndex: "+b.getPointIndex(), 10, 80);
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
