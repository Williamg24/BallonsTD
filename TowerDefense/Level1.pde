public class Level1 extends Level{
  PImage mapImg;
  int[][] points = {{0,296}, {445,296}, {296,131}, {294,131}, {294,566}, {145,566}, {145,405}, {565,405}, {566,236}, {679,236}, {679,508}, {400,height}};
  
  public Level1() {
    super();
    mapImg = loadImage("Level1_map.jpg");
    
  }
  
  public void startAnimation() {
    for (int i=0; i<10; i++) {
      bloons.add(new Bloon(0, (float) i * -0.08,points[0][0], points[0][1]));
    }
  }

  public void display() {
    displayPath();
    displayBloons();
  }

  public void displayPath() {
    image(mapImg, 0, 0, MAP_WIDTH, height);
  }
  
  //public float pathFunctionX(float x, float speed, int index) {
  //  if (index % 2 == 0) {
  //    float newX = x + speed*1000;
  //    if (newX > points[index][0]) {
        
  //    }
  //  } else {
  //    return x;
  //  }
  //}
  
  public float pathFunctionY(int t) {
    return height/2;
  }
  
  public void displayBloons() {
    Bloon b;
    int[] reference;
    int index;
    for (int i=0; i<bloons.size(); i++) {
      b = bloons.get(i);
      if (! b.isPopped()) {
        b.move();
        index = b.getPointIndex();
        reference = points[index];
        b.setNewX(reference[0], findConstantX(index));
        b.setNewY(reference[1], findConstantY(index));
        b.display();
      } else {
        if (b.getT() > 1) {      // decrease health if bloon went off map
          health--;
        } else {                 // a tower popped it
          money += b.worth();
        }
        bloons.remove(i);
        i--;
      }
    }
  }
  
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
    return (y > height/2 - 40 && y < height/2 + 40 && x > 0 && x < MAP_WIDTH);
  }
  
}
