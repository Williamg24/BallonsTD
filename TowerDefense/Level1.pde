int[][][] levelPoints = {{{0, height/2}, {MAP_WIDTH, height/2}}, 
  {{0, 296}, {445, 296}, {445, 129}, {294, 129}, {294, 566}, {145, 566}, {145, 405}, {572, 405}, {572, 236}, {679, 236}, {679, 512}, {400, 512}, {400, height}}, 
  {{745, 0}, {745, 136}, {727, 169}, {683, 187}, {628, 164}, {571, 121}, {523, 98}, {442, 90}, {334, 120}, {281, 160}, {235, 222}, {207, 290}, {198, 365}, 
    {208, 430}, {235, 496}, {259, 530}, {313, 579}, {380, 618}, {474, 628}, {554, 606}, {629, 559}, {653, 523}, {643, 498}, {620, 479}, {588, 485}, {534, 524}, {461, 539}, 
    {400, 531}, {335, 495}, {297, 436}, {279, 372}, {285, 316}, {312, 255}, {351, 213}, {404, 183}, {471, 173}, {494, 190}, {501, 214}, {499, 238}, {484, 253}, 
  {443, 263}, {400, 282}, {371, 314}, {362, 358}, {380, 412}, {420, 447}, {468, 455}, {515, 435}, {540, 400}, {555, 372}, {586, 360}, {MAP_WIDTH, 360}}};


public class Level1 extends Level {
  PImage mapImg;
  int[][] points;// = {{0,296}, {445,296}, {445,129}, {294,129}, {294,566}, {145,566}, {145,405}, {572,405}, {572,236}, {679,236}, {679,512}, {400,512}, {400,height}};
  int pathWidth;
  int levelNum;

  public Level1(int[][] points_, String imageName) {
    super();
    points = points_;
    mapImg = loadImage(imageName);
    pathWidth = 50;
  }

  public Level1(int levelType) {
    levelNum = levelType;
    points = levelPoints[levelNum];
    mapImg = loadImage("Level"+levelNum+"_map.jpg");
    switch (levelNum) {
    case 1:
      pathWidth = 50;
      break;
    case 2:
      pathWidth = 36;
      break;
    }
  }

  public void startAnimation() {
    if (bloons.size() == 0) {
      for (int i=0; i<20; i++) {
        //if (i % 5 == 0) {
        //  bloons.add(new Bloon(1,points[0][0] - (float) i * 70, points[0][1], points.length));
        //}
        if (points[0][0] == 0) {
          bloons.add(new Bloon(1, points[0][0] - (float) i * 70, points[0][1], points.length));
        } else {
          bloons.add(new Bloon(1, points[0][0], points[0][1] - (float) i * 70, points.length));
        }
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
      bloons.add(index-1, b);
    } else if (pIndex1 == pIndex2) {
      int aimX = points[pIndex1][0];
      int aimY = points[pIndex1][1];
      if (dist(b.getX(), b.getY(), aimX, aimY) < dist(prev.getX(), prev.getY(), aimX, aimY)) {
        bloons.remove(index);
        bloons.add(index-1, b);
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

    // displays points
    //fill(200, 0, 0);
    //noStroke();
    //for (int[] point : points) {
    //  ellipse(point[0], point[1], 4, 4);
    //}
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
        if (! b.setNewCoord(reference)) {
          b.increasePointIndex();
          index = b.getPointIndex();
          if (index < points.length) {
            reference = points[index];
            b.setNewCoord(reference);
          }
        }
        //b.setNewX(reference[0], findConstantX(index),index);
        //b.setNewY(reference[1], findConstantY(index),index);

        //if (i > 0 && b.getType() > 0) {
        //  swapOrder(i);
        //}
        b.display();
      }
      if (b.isPopped()) {
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

  //// finds out if x should be increased or decreased
  //public int findConstantX(int index) {
  //  if (points[index][0] - points[index-1][0] > 0) {
  //     return 1;
  //  }
  //  return -1;
  //}

  //public int findConstantY(int index) {
  //  if (points[index][1] - points[index-1][1] > 0) {
  //     return 1;
  //  }
  //  return -1;
  //}

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
      if (inRectangle(x, y, i)) {
        return true;
      }
    }
    return false;
  }
}
