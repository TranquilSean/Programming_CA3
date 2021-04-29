void drawTree(float sample, float colour, float lenght) 
{
  float a = sample;
  float l = lenght;
  float c = colour;
  theta = radians(a);
  frameRate(100);
  stroke(c, 200, 220);
  strokeWeight(3);
  translate(width/2, height-50);
  line(0, 0, 0, -l);
  translate(0, -l);
  branch(l, c);
  
}
void branch(float h, float c) {
  h *= 0.75;
  
  strokeWeight(2);
  if (h < 20) {
    noStroke();
    fill(120, random(180,220), random(180,220));//greencolor
    ellipse(0, 0, h, h);
  } else {
    
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
    stroke(c, 200, 220);
    strokeWeight(2);
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h,c);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    // Left Branch
    
    pushMatrix();
    stroke(c, 200, 220);
    strokeWeight(2);
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h,c);
    popMatrix();
  }
}
