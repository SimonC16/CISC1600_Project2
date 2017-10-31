/*
 * Simon Chow, Eric Li
 * Project 2
 * CISC 1600
 */

int xPos = 300, yPos = 200; // kite coordinates
int kiteTailAnim = 0;
boolean startAnim = false, kiteTailAnimReverse;
String kiteColor = "ffffffff";
boolean morning = true;
boolean animateSunOrMoon = false;
boolean rising = false;
boolean setting = false;
PVector center, point;
float angle;
float radius;
float x, y;

PFont font, smallFont;

void setup() {
  size(500, 500); // screen size
  frameRate(24);
  String[] fontList = PFont.list();
  font = createFont(fontList[0], 50);
  smallFont = createFont(fontList[0], 25);
  center = new PVector(500,500);
  point = new PVector(25,525);
  //find the angle between the points
  radius = dist(center.x, center.y, point.x, point.y);
}

void draw() {
  if(!startAnim)
    drawStartScreen();
  else {
    if(morning){
      if(setting){background(0);}
      else{background(255);}// white background
    }
    else{
      if(setting){background(255);}
      else{background(0);}
    }
    drawSunOrMoon();
    drawKite();
    drawKiteTail();
  }
}

/**
 * Draws individual parts of a kite.
 */
void drawKite() {
  // kite
  strokeWeight(3); // thicker outline for kite
  fill(unhex(kiteColor)); // convert string representation of hexadecimal 
                          // number to equivalent integer value
  quad(xPos, yPos, xPos-50, yPos-70, xPos, yPos-140, xPos+50, yPos-70);
  noFill();
  
  // kite frame
  strokeWeight(2);
  line(xPos, yPos, xPos, yPos-140); // vertical frame
  line(xPos-50, yPos-70, xPos+50, yPos-70); // horiztonal frame

  // kite line using a bezier curve
  strokeWeight(1); // thinner line for kite line
  bezier(xPos, yPos, xPos-30, yPos+170, xPos-160, yPos+70, 0, 500);
}

// TODO: kite tail that reacts to user movement
// (ie. flows to right when kite moves left and vice-versa)
void drawKiteTail() {
  strokeWeight(2);
  if(kiteTailAnim == 0) {
    bezier(xPos, yPos, xPos+55, yPos+45, xPos+100, yPos+20, xPos+150, yPos+20);
    bezier(xPos, yPos, xPos+60, yPos+40, xPos+115, yPos+15, xPos+165, yPos+25);
    bezier(xPos, yPos, xPos+45, yPos+50, xPos+110, yPos+30, xPos+160, yPos+10);
    fill(unhex(kiteColor));
    ellipse(xPos+150, yPos+20, 10, 10);
    ellipse(xPos+165, yPos+25, 10, 10);
    ellipse(xPos+160, yPos+10, 10, 10);
    noFill();
    kiteTailAnimReverse = false;
    kiteTailAnim += 1;
  }
  else if(kiteTailAnim == 1) {
    bezier(xPos, yPos, xPos+56, yPos+44, xPos+99, yPos+19, xPos+151, yPos+21);
    bezier(xPos, yPos, xPos+59, yPos+41, xPos+114, yPos+14, xPos+166, yPos+26);
    bezier(xPos, yPos, xPos+46, yPos+49, xPos+109, yPos+29, xPos+161, yPos+11);
    fill(unhex(kiteColor));
    ellipse(xPos+151, yPos+21, 10, 10);
    ellipse(xPos+166, yPos+26, 10, 10);
    ellipse(xPos+161, yPos+11, 10, 10);
    noFill();
    if(kiteTailAnimReverse == false)
      kiteTailAnim += 1;
    else
      kiteTailAnim -= 1;
  }
  else if(kiteTailAnim == 2) {
    bezier(xPos, yPos, xPos+57, yPos+43, xPos+98, yPos+18, xPos+152, yPos+22);
    bezier(xPos, yPos, xPos+58, yPos+42, xPos+113, yPos+13, xPos+167, yPos+27);
    bezier(xPos, yPos, xPos+47, yPos+48, xPos+108, yPos+28, xPos+162, yPos+12);
    fill(unhex(kiteColor));
    ellipse(xPos+152, yPos+22, 10, 10);
    ellipse(xPos+167, yPos+27, 10, 10);
    ellipse(xPos+162, yPos+12, 10, 10);
    noFill();
    if(kiteTailAnimReverse == false)
      kiteTailAnim += 1;
    else
      kiteTailAnim -= 1;
  }
  else if(kiteTailAnim == 3) {
    bezier(xPos, yPos, xPos+58, yPos+42, xPos+97, yPos+17, xPos+153, yPos+23);
    bezier(xPos, yPos, xPos+57, yPos+43, xPos+112, yPos+12, xPos+168, yPos+28);
    bezier(xPos, yPos, xPos+48, yPos+47, xPos+107, yPos+27, xPos+163, yPos+13);
    fill(unhex(kiteColor));
    ellipse(xPos+153, yPos+23, 10, 10);
    ellipse(xPos+168, yPos+28, 10, 10);
    ellipse(xPos+163, yPos+13, 10, 10);
    noFill();
    if(kiteTailAnimReverse == false)
      kiteTailAnim += 1;
    else
      kiteTailAnim -= 1;
  }
  else if(kiteTailAnim == 4) {
    bezier(xPos, yPos, xPos+59, yPos+41, xPos+96, yPos+16, xPos+154, yPos+24);
    bezier(xPos, yPos, xPos+56, yPos+44, xPos+111, yPos+11, xPos+169, yPos+29);
    bezier(xPos, yPos, xPos+49, yPos+46, xPos+106, yPos+26, xPos+164, yPos+14);
    fill(unhex(kiteColor));
    ellipse(xPos+154, yPos+24, 10, 10);
    ellipse(xPos+169, yPos+29, 10, 10);
    ellipse(xPos+164, yPos+14, 10, 10);
    noFill();
    if(kiteTailAnimReverse == false)
      kiteTailAnim += 1;
    else
      kiteTailAnim -= 1;
  }
  else if(kiteTailAnim == 5) {
    bezier(xPos, yPos, xPos+60, yPos+40, xPos+95, yPos+15, xPos+155, yPos+25);
    bezier(xPos, yPos, xPos+55, yPos+45, xPos+110, yPos+10, xPos+170, yPos+30);
    bezier(xPos, yPos, xPos+50, yPos+45, xPos+105, yPos+25, xPos+165, yPos+15);
    fill(unhex(kiteColor));
    ellipse(xPos+155, yPos+25, 10, 10);
    ellipse(xPos+170, yPos+30, 10, 10);
    ellipse(xPos+165, yPos+15, 10, 10);
    noFill();
    kiteTailAnimReverse = true;
    kiteTailAnim -= 1;
  }
}

void drawSunOrMoon(){
  if(morning){
    if(setting){animateSunOrMoon(255);}
    else{animateSunOrMoon(0);}
  }
  else{
    if(setting){animateSunOrMoon(0);}
    else{animateSunOrMoon(255);}
  }
}
void animateSunOrMoon(int g){
  if(animateSunOrMoon){
    if(rising){
      setting = false;
      if(angle>=1.375*PI){
        animateSunOrMoon = false;
        angle = 1.375*PI;
      }
    }
    else{
      if(angle>1.6*PI){
        float deltaX = center.x - point.x;
        float deltaY = center.y - point.y;
        angle = atan2(deltaX, deltaY);
        rising = true;
      }
    }
    //find the point based on the angle
    x = center.x + cos(angle)*radius;
    y = center.y + sin(angle)*radius;
    fill(255,255,g);
    ellipse(x, y, 50, 50);

    //increment the angle to move the point
    angle += PI/180;
  }
  else{
    angle = 1.375*PI;
    x = center.x + cos(angle)*radius;
    y = center.y + sin(angle)*radius;
    fill(255,255,g);
    ellipse(x, y, 50, 50);
  }
}
void keyPressed() {
  // kite movement keys
  if(keyCode == UP)
    yPos -= 2;
  else if(keyCode == DOWN)
    yPos += 2;
  else if(keyCode == LEFT)
    xPos -= 2;
  else if(keyCode == RIGHT)
    xPos += 2;
  
  // kite color change keys
  if(key == 'R' || key == 'r')
    kiteColor = "ffff0000";
  else if(key == 'G' || key == 'g')
    kiteColor = "ff00ff00";
  else if(key == 'B' || key == 'b')
    kiteColor = "ff0000ff";
    
  // navigate away from start screen
  if(key == 'S' || key == 's')
    startAnim = true;
}

void mousePressed() {
  if(!startAnim){return;}
  if(morning){
    morning = false;
    setting = true;
    rising = false;
    animateSunOrMoon = true;
  }
  else{
    morning = true;
    setting = true;
    rising = false;
    animateSunOrMoon = true;
  }
}

void drawStartScreen() {
  background(255);
  textFont(font);
  textAlign(CENTER);
  fill(0);
  text("Interactive Kite Animation", width/2, 150);
  text("Press 'S' to start", width/2, 400);
  
  textFont(smallFont);
  text("Use the arrow keys to move the kite.", width/2, 250);
  text("Press 'R', 'G', or 'B' to change the color of the kite.", width/2, 280);
}