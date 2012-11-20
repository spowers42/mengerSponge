//import ketai.ui.*;
import processing.opengl.*;
import peasy.*;

//KetaiGesture gesture;
Sponge sponge;
PeasyCam cam;
int MAXITERATIONS = 3;
int iterations;

void setup(){
  size(800, 640, OPENGL);
  //gesture = new KetaiGesture(this);
  cam = new PeasyCam(this, 0, 0, 0, 400);
  sponge = new Sponge(150, new PVector(0,0,0));
  iterations = 0;
  rectMode(CENTER);
}

void draw(){
  background(0);
  lights();
  sponge.draw();
}

void mouseClicked(){
  if (iterations<MAXITERATIONS){
    iterations++;
    sponge.divide();
  }
}

//void onFlick(float x, float y, float px, float py, float w){
//  if(iterations<MAXITERATIONS){
//    iterations++;
//    sponge.divide();
//  }
//}


//public boolean surfaceTouchEvent(MotionEvent event) {
//
//  //call to keep mouseX, mouseY, etc updated
//  super.surfaceTouchEvent(event);
//
//  //forward event to class for processing
//  return gesture.surfaceTouchEvent(event);
//}
