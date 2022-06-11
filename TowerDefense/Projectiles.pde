public class Projectiles{
  int x,y;
  float speed;
  Bloon b;
  PImage dart;
  float angle;
  
  Projectiles(int fromx, int fromy, Bloon target, float s){
    x = fromx;
    y = fromy;
    b = target;
    speed = s;
    dart = loadImage("dart.png");
  }
  
  
  void display(){
   image(dart,x,y);
   faceAngle();
   faceTarget();
   move();
  }
  
  void move(){
    
  }
  
  void faceTarget(){
    pushMatrix();
      translate(x, y);
      angle = -atan2(b.xCor -x, b.yCor - y)+PI;
      rotate(angle);
      image(dart,10,10);
      popMatrix();
  }
  
  void faceAngle(){
    pushMatrix();
    translate(x, y);
    rotate(angle);
    image(dart,10,10);
    popMatrix();
  }
}
