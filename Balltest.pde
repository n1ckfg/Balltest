import processing.opengl.*;

float distance = 0;
float divider = 50;
boolean clicked = false;
boolean debug = true;
Ball ball;

void setup(){
  size(640,480,OPENGL);
  ball = new Ball(width/2,height/2);
}

void draw(){
  background(127);
  ball.run();
  
  if(mousePressed){
    distance=dist(mouseX,mouseY,pmouseX,pmouseY);
    if(pmouseX>mouseX) distance *= -1;
    println(distance);
    if(debug){
      noFill();
      strokeWeight(2);
      stroke(0,100);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
    ball.a.x = distance/divider;
  }
}

void mouseReleased(){
  distance=0;
  ball.a = new PVector(0,0);
}

void keyPressed(){
  if(key=='d' || key=='D') debug = !debug;
}
