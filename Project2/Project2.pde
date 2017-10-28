/*
 * Simon Chow, Eric Li
 * Project 2
 * CISC 1600
 */

int xPos = 300, yPos = 200; // kite coordinates
String kiteColor = "ffffffff";

void setup() {
  size(500, 500); // screen size
}

void draw() {
  background(255); // white background
  drawKite();
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
}