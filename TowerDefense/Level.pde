import java.util.*;

int[][][] levelPoints = {{{0, 700/2}, {MAP_WIDTH, 700/2}}, // Level 0, stright path
  // Level 1
  {{0, 296}, {445, 296}, {445, 129}, {294, 129}, {294, 566}, {145, 566}, {145, 405}, {572, 405}, {572, 236}, {679, 236}, {679, 512}, {400, 512}, {400, 700}}, 
  // Level 2
  {{745, 0}, {745, 136}, {727, 169}, {683, 187}, {628, 164}, {571, 121}, {523, 98}, {442, 90}, {334, 120}, {281, 160}, {235, 222}, {207, 290}, {198, 365}, 
    {208, 430}, {235, 496}, {259, 530}, {313, 579}, {380, 618}, {474, 628}, {554, 606}, {629, 559}, {653, 523}, {643, 498}, {620, 479}, {588, 485}, {534, 524}, {461, 539}, 
    {400, 531}, {335, 495}, {297, 436}, {279, 372}, {285, 316}, {312, 255}, {351, 213}, {404, 183}, {471, 173}, {494, 190}, {501, 214}, {499, 238}, {484, 253}, 
  {443, 263}, {400, 282}, {371, 314}, {362, 358}, {380, 412}, {420, 447}, {468, 455}, {515, 435}, {540, 400}, {555, 372}, {586, 360}, {MAP_WIDTH, 360}}};
  
int[][] bloonTypesInRound = {{20,0,0}, {35,0,0}, {25,5,0}, {35,18,0}, {5,27,0}};

public class Level {
  PImage mapImg;
  int[][] points;
  int pathWidth;
  int levelNum;
  ArrayList<Bloon> bloons;

  public Level(int levelType) {
    bloons = new ArrayList<Bloon>();
    levelNum = levelType;
    //println(Arrays.deepToString(levelPoints[1]));
    points = levelPoints[levelNum];
    //println(height);
    //println(Arrays.deepToString(points));
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

  public void clearBloons() {
    bloons = new ArrayList<Bloon>();
  }

  public void startAnimation() {
    if (bloons.size() == 0) {
      addBloons();
    }
  }

  // adds the corresponding number of bloons evenly spread out
  public void addBloons(){
    int[] bloonNums = bloonTypesInRound[round];
    int maxBloons= max(bloonNums);
    int[] mods = new int[3];              // keeps track whento add bloons
    
    for(int i=0; i<3; i++) {
      if (bloonNums[i] != 0){
        mods[i] = maxBloons / bloonNums[i];
      } else {
        mods[i] = maxBloons+1;
      }
    }
    //println(Arrays.toString(mods));
    
    for (int j=0; j<maxBloons; j++) {
      float[] coords;
      // determine where to add bloons
      if (points[0][0] == 0) {
        coords = new float[]{points[0][0] - (float) (j+1) * 70, points[0][1]};
      } else {
        coords = new float[]{points[0][0], points[0][1] - (float) (j+1) * 70};
      }
      // add them if this is right location
      for (int k=0; k<3; k++) {
        if ((j+1) % mods[k] == 0) {
          bloons.add(new Bloon(k, coords, points.length));
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

  public int getType() {
    return levelNum;
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
    if (bloons.size() == 0 && round < bloonTypesInRound.length - 1) {//animate &&
      displayPath();
      round++;
      startAnimation();
    }

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

    //Bloon b;
    //textSize(20);
    //for (int i=0; i<bloons.size(); i++) {
    //  b = bloons.get(i);
    //  text(b+" Coords: "+b.xCor+","+b.yCor,30,40+20*i);
    //}
    text("bloons length: "+bloons.size(),10,40);
  }

  public void displayPath() {
    if (mapImg != null) {
      image(mapImg, 0, 0, MAP_WIDTH, height);
    }
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
        if (! b.setNewCoord(reference)) {          // the bloon's target point needs to be changed
          b.increasePointIndex();
          index = b.getPointIndex();
          if (index < points.length) {
            reference = points[index];
            b.setNewCoord(reference);
          }
        }
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
      //textSize(20);
      //text("Coords: "+b.xCor+","+b.yCor,30,40+20*i);
      //fill(0);
      //ellipse(b.xCor, b.yCor, 10,10);
    }

    //for (Bloon l:bloons) {
    //  ellipse(l.xCor, l.yCor, 10,10);
    //}
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

  // returns if (x,y) is within pathWidth/2 from the line from point at pointIndex to the next one
  private boolean inPathRegion(float x, float y, int pointIndex) {
    int[] point1, point2;
    float d1, d2, pathLength;

    point1 = points[pointIndex];
    point2 = points[pointIndex+1];

    d1 = dist(point1[0], point1[1], x, y);
    d2 = dist(point2[0], point2[1], x, y);
    pathLength = dist(point1[0], point1[1], point2[0], point2[1]);           // distance between the 2 points defining the path
    return ! (sqrt(d1 * d1 - pow(pathWidth/2, 2)) + sqrt(d2 * d2 - pow(pathWidth/2, 2)) > pathLength);
  }

  public boolean onPath(float x, float y) {
    for (int i = 0; i<points.length-1; i++) {
      if (inPathRegion(x, y, i)) {
        return true;
      }
    }
    return false;
  }
}
