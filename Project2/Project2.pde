/*
 * Simon Chow, Eric Li
 * Project 2
 * CISC 1600
 */

int xPos = 300, yPos = 200; // kite initial coordinates
int cloudXPos = -70, cloudYPos = 95; // cloud initial coordinates
int cloudColor = 255; // cloud initial color, changes based on time of day
int kiteTailAnim = 0; // frame # the kite tail animation is on
boolean startAnim = false, kiteTailAnimReverse;
String kiteColor = "ffffffff";  // kite color, stored in string to easily change value
                                // can be converted using unhex() and used in stroke(), fill(), etc
boolean morning = true; //Is it morning or night?
boolean animateSunOrMoon = false; //Are you changing the time of the day?
boolean rising = false; //Is the Sun/Moon rising?
boolean setting = false; //Is the Sun/Moon setting?
PVector center, point; //Center of path and Center of Sun/Moon
float angle; //Current angle of Sun/Moon relative to the center
float radius; // distance from rotational center to Sun/Moon
float x, y; // position of Sun or Moon
float[] placementX = new float[20]; //placement of stars x-axis
float[] placementY = new float[20]; //placement of stars y-axis
int starAnimation = 1;

PFont font, smallFont;

void setup() {
  size(500, 500); // screen size
  frameRate(24); // set lower frame rate to smooth out animation
  String[] fontList = PFont.list(); // get list of fonts from the OS
  font = createFont(fontList[0], 50); // create a font using first in list, font size 50
  smallFont = createFont(fontList[0], 25); // create a font using first in list, font size 25
  center = new PVector(500,500);
  point = new PVector(25,525);
  //find the angle between the points
  radius = dist(center.x, center.y, point.x, point.y);
}
/**
  Main loop:
  Show Main screen and animate Kite Simulation when promped.
**/
void draw() {
  if(!startAnim)
    drawStartScreen(); // display start screen if animation has not started
  else {
    if(morning){
      if(setting) {
        background(#090028); // deep purple background
        cloudColor = 100; // dark gray cloud
      } 
      else {
        background(#7ec0ee); // sky blue background
        cloudColor = 255; // white cloud
      } 
    }
    else{
      if(setting) {
        background(#7ec0ee);
        cloudColor = 255;
      }
      else { 
        background(#090028);
        cloudColor = 100;
      }
    }
    /*
      From lower level to topmost level:
      1. Stars
      2. Sun/Moon
      3. Clouds
      4. Kite
    */
    // Display the Night sky when the Moon is up
    if(!setting && !morning || morning && setting){
      nightSky();
    }
    drawSunOrMoon();
    drawCloud();
    if(kiteColor == "ffffffff"){stroke(0);}
    else{stroke(unhex(kiteColor));}
    drawKite();
    drawKiteTail();
  }
}

/**
 * Draws individual parts of a kite.
 */
void drawKite() {
  // kite itself
  strokeWeight(3); // thicker outline for kite
  stroke(130);
  fill(unhex(kiteColor)); // convert string representation of hexadecimal 
                          // number to equivalent integer value
  quad(xPos, yPos, xPos-50, yPos-70, xPos, yPos-140, xPos+50, yPos-70);
  noFill();
  
  // kite frame
  strokeWeight(2);
  stroke(130);
  line(xPos, yPos, xPos, yPos-140); // vertical frame
  line(xPos-50, yPos-70, xPos+50, yPos-70); // horiztonal frame
  // kite line using a bezier curve
  strokeWeight(1); // thinner line for kite line
  bezier(xPos, yPos, xPos-30, yPos+170, xPos-160, yPos+70, 0, 500);
}

// TODO: kite tail that reacts to user movement
// (ie. flows to right when kite moves left and vice-versa)
/**
 * Draws animated kite tails.
 */
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
    kiteTailAnimReverse = true; // set to true to reverse the animation
    kiteTailAnim -= 1;
  }
}

void drawCloud() {
  stroke(cloudColor); // change cloud color depending on time of day
  fill(cloudColor);
  ellipse(cloudXPos, cloudYPos, 30, 30);
  ellipse(cloudXPos+20, cloudYPos, 45, 40);
  ellipse(cloudXPos+38, cloudYPos, 35, 25);
  noFill();
  cloudXPos += 2;
  if(cloudXPos > 570)  // when cloud moves off screen,
    cloudXPos = -70;   // reset position
}
/*
  Decides whether the Sun or the Moon is drawn
*/
void drawSunOrMoon(){
  if(morning){
    if(setting){
      stroke(255,255,255);
      animateSunOrMoon(255);
    }
    else{
      stroke(255,255,0);
      animateSunOrMoon(0);
    }
  }
  else{
    if(setting){
      stroke(255,255,0);
      animateSunOrMoon(0);
    }
    else{
      stroke(255,255,255);
      animateSunOrMoon(255);
    }
  }
}
/*
  If it is changing from Night to Day or vice versa, make the sun/moon set and rise.
*/
void animateSunOrMoon(int g){
  if(animateSunOrMoon){
    if(rising){
      setting = false;
      if(angle>=1.375*PI){
        animateSunOrMoon = false;
        angle = 1.375*PI;
        rising = false;
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
/*
  Calls stars to create stars while it sets the positions
  -- To emulate shining shape chages between having more or less nodes.
*/
void nightSky(){
  if(starAnimation==0){starAnimation++;}
  else{
    if(frameCount % 15 == 0) {  // control frequency of new stars
                                // lower divisor = higher frequency
      starAnimation--;
      for(int i = 0; i < 20; i++){
        placementX[i] = random(0,500);
        placementY[i] = random(0,500);
      }
    }
  }
  for(int i = 0; i < 20; i++){
    if(starAnimation == 0){
      star(placementX[i],placementY[i],5,10,5);
    }
    else{
      star(placementX[i],placementY[i],5,10,40);
    }
  }
}
/*
  Create star shapes
*/
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  fill(255,255,0);
  stroke(255,255,0);
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
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
  
  // kite color changing keys
  if(key == 'R' || key == 'r')
    kiteColor = "ffff0000"; // r for red
  else if(key == 'G' || key == 'g')
    kiteColor = "ff00ff00"; // g for green
  else if(key == 'B' || key == 'b')
    kiteColor = "ff0000ff"; // b for blue
    
  // navigate away from start screen
  if(key == 'S' || key == 's')
    startAnim = true; // s for start
}
/*
  **Only when out of Start Screen does it listen**
  Changes between morning and night.
*/
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
  background(150);
  textFont(font);
  textAlign(CENTER);
  fill(0);
  text("Interactive Kite Animation", width/2, 150); // width/2 = place in horizontal center
  text("Press 'S' to start", width/2, 420);
  
  textFont(smallFont);
  text("Use the arrow keys to move the kite.", width/2, 220);
  text("Press 'R', 'G', or 'B' to change the color of the kite.", width/2, 250);
  text("Click the left mouse button to cycle", width/2, 280);
  text("through the day and night cycle.", width/2, 310);
}