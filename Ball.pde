class Ball {

  PVector s, p, v, a, f;

  Ball(float _x, float _y) {
    s = new PVector(50,50); //size
    p = new PVector(_x,_y); //position
    v = new PVector(0, 0); //velocity
    a = new PVector(0, 0); //acceleration
    f = new PVector(0.9, 0.9); //acceleration
  }

  void update() {
    v.add(a);
    v.mult(f);
    p.add(v);
    println("v: " + v + " a: " + a);
  }

  void draw() {
    noStroke();
    fill(255, 0, 0);
    ellipseMode(CENTER);
    ellipse(p.x, p.y, s.x, s.y);
  }

  void run() {
    update();
    draw();
  }

  //2D Hit Detect.  Assumes center.  x,y,w,h of object 1, x,y,w,h, of object 2.
  boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
    w1 /= 2;
    h1 /= 2;
    w2 /= 2;
    h2 /= 2; 
    if (x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
      return true;
    } 
    else {
      return false;
    }
  }
  
}

void zeroPVector(PVector _p, float _f){
  if(_p.x < _f) _p.x = 0;
  if(_p.y < _f) _p.y = 0;
  try{
    if(_p.z < _f) _p.z = 0;
  }catch(Exception e){ }
}

