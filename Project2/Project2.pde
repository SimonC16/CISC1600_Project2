/*
  Simon Chow, Eric Li
  Project 2
  CISC 1600
*/

int imageNum = 0;

void setup() {
  size(500, 500);
  background(255);
  frameRate(5);
}

void draw() {
  background(#2ebce8);
  drawKite();
}

void drawKite() {
  pushMatrix();
  
  if(imageNum == 0) {
    // first frame
    fill(0, 255, 0);
    quad(400, 100, 460, 200, 400, 300, 340, 200);
    stroke(255, 0, 0);
    line(400, 100, 400, 300);
    line(460, 200, 340, 200);
    stroke(0);
    noFill();
    bezier(400, 300, 360, 500, 120, 350, 0, 500);
    imageNum++;
  }
  
  else if(imageNum == 1) {
    // second frame
    fill(0, 255, 0);
    quad(405, 100, 465, 200, 405, 300, 345, 200);
    stroke(255, 0, 0);
    line(405, 100, 405, 300);
    line(465, 200, 345, 200);
    stroke(0);
    noFill();
    bezier(405, 300, 370, 500, 130, 350, 0, 500);
    imageNum++;
  }
  
  else if(imageNum == 2) {
    // third frame
    fill(0, 255, 0);
    quad(410, 100, 470, 200, 410, 300, 350, 200);
    stroke(255, 0, 0);
    line(410, 100, 410, 300);
    line(470, 200, 350, 200);
    stroke(0);
    noFill();
    bezier(410, 300, 370, 500, 130, 350, 0, 500);
    imageNum++;
  }
  
    else if(imageNum == 3) {
    // repeat second frame
    fill(0, 255, 0);
    quad(405, 100, 465, 200, 405, 300, 345, 200);
    stroke(255, 0, 0);
    line(405, 100, 405, 300);
    line(465, 200, 345, 200);
    stroke(0);
    noFill();
    bezier(405, 300, 370, 500, 130, 350, 0, 500);
    imageNum = 0;
  }
  
  popMatrix();
}