public class Level1 extends Level{
  PImage mapImg;
  int[][] points = {{0,296}, {445,296}, {445,129}, {294,129}, {294,566}, {145,566}, {145,405}, {572,405}, {572,236}, {679,236}, {679,512}, {400,512}, {400,height}};
  int pathWidth;

  public Level1() {
    super();
    mapImg = loadImage("Level1_map.jpg");
    pathWidth = 50;
  }

  public void startAnimation() {
    if (bloons.size() == 0) {
      for (int i=0; i<20; i++) {
        //if (i % 5 == 0) {
        //  bloons.add(new Bloon(1,points[0][0] - (float) i * 70, points[0][1], points.length));
        //}
         bloons.add(new Bloon(1,points[0][0] - (float) i * 70, points[0][1], points.length));
      }
    }
  }
  
  public void sortBloons() {
    Bloon b;
    for (int i=1; i<bloons.size(); i++) {
      b = bloons.get(i);
      if (b.getType() > 0) {
        swapOrder(i);
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
      if (dist(b.getX(),b.getY(),aimX,aimY) < dist(prev.getX(),prev.getY(),aimX,aimY)) {
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
    //text("bloons length: "+bloons.size(),10,40);
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
      //text("pointIndex: "+b.getPointIndex(), 10, 80);
      if (! b.isPopped()) {
        //b.move();
        index = b.getPointIndex();
        reference = points[index];
        b.setNewX(reference[0], findConstantX(index),index);
        b.setNewY(reference[1], findConstantY(index),index);
        
        //if (i > 0 && b.getType() > 0) {
        //  swapOrder(i);
        //}
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
    sortBloons();
  }
  
  public void displayStillBloons() {
    Bloon b;
    for (int i=0; i<bloons.size(); i++) {
      b = bloons.get(i);
      b.display();
      //text("pointIndex: "+b.getPointIndex(), 10, 80);
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
  
  // checks if (x,y) is on the path from rect to rect+1
  private boolean inRectangle(float x, float y, int rect) {
    //fill(100,30,100,50);
    if (points[rect][0] == points[rect+1][0]) {
      if (x > points[rect][0] - pathWidth/2 && x < points[rect][0] + pathWidth/2) {
        return (y > min(points[rect][1], points[rect+1][1]) - pathWidth/2 && y < max(points[rect][1], points[rect+1][1]) + pathWidth/2);
      }
    } else {
      if (y > points[rect][1] - pathWidth/2 && y < points[rect][1] + pathWidth/2) {
        return (x > min(points[rect][0], points[rect+1][0]) - pathWidth/2 && x < max(points[rect][0], points[rect+1][0]) + pathWidth/2);
      }
    }
    return false;
  }

  public boolean onPath(float x, float y) {
    for (int i = 0; i<points.length-1; i++) {
      if (inRectangle(x,y,i)) {
        return true;
      }
    }
    return false;
  }

}
