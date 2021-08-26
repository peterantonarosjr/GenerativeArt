float angleNoise, radiusNoise;
float xNoise, yNoise;
float angle = PI/2;
float radius;
int lineColor = 1;
int lineColorChange = 1;
int lineAlpha = 90;
int lineAlphaChange = -1;

void setup() {
  size(1920,1080);
  smooth();
  frameRate(60); //Set this to monitor refresh rate for best results
  background(0);
  noFill();
  
  angleNoise = random(10);
  radiusNoise = random(10);
  xNoise = random(10);
  yNoise = random(10);  
}

void draw() {
  radiusNoise += 0.05;
  radius = (noise(radiusNoise) * 500) +1;
  angleNoise += 0.01;
  angle += (noise(angleNoise) *5) - 3;
  
  if (angle > 360) {
    angle -= 360;
  }
  if (angle < 0) {
    angle += 360;
  }
  
  xNoise += 0.01;
  yNoise += 0.01;
  float centerX = width/2 + (noise(xNoise) * 100) - 50;
  float centerY = height/2 + (noise(yNoise) * 100) - 50;
  float radians = radians(angle);
  float radiansOpposite = radians + PI;
  float x1 = centerX + (radius * cos(radians));
  float y1 = centerY + (radius * sin(radians));  
  float x2 = centerX + (radius * cos(radiansOpposite));
  float y2 = centerY + (radius * sin(radiansOpposite));
 
  lineColor += lineColorChange;
  lineAlpha += lineAlphaChange;
  
  if (lineColor >  254) {
    lineColorChange = -1;
  }
  if (lineColor < 0) {
    lineColorChange = 1;
  }
  if (lineAlpha > 90) {
    lineAlphaChange = -1;
  }
  if (lineAlpha < 30) {
    lineAlphaChange = 1;
  }
   
  stroke(lineColor,lineAlpha);
  strokeWeight(0.5);
  line(x1,y1,x2,y2);
}
