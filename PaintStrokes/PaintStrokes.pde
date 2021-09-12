int screenXCenter;
int screenYCenter;

PaintStroke[] strokes = new PaintStroke[floor(random(50,200))];

void setup() {
  size(1200,500);
  smooth(16);
  frameRate(144);
  noFill();
  background(0,0,0);
  screenXCenter = width/2;
  screenYCenter = height/2;
  
  for(int i=0; i<strokes.length; i++){
    strokes[i] = new PaintStroke(1,0,random(1.5*height/5,3.5*height/5));
  }
  
}

void draw() {
  
  for(int i=0; i<strokes.length; i++){
    
    float x1 = strokes[i].getXpos();
    float y1 = strokes[i].getYPos();
    strokes[i].updateStroke();
    float x2 = strokes[i].getXpos();
    float y2 = strokes[i].getYPos();
    stroke(y1,y1,y1);
    strokeWeight(x2/y2);
    //strokeWeight(1);
    line(x1,y1,x2,y2);
       
  }
  
}

class PaintStroke {
  float moveSpeed;
  float xPos;
  float yPos;
  boolean isEnd;
  
    
  PaintStroke(float moveSpeed, float xPos, float yPos) {
    this.moveSpeed = moveSpeed;
    this.xPos = xPos;
    this.yPos = yPos;
    this.isEnd = false;
  }
    
  float getMoveSpeed() {
    
    return moveSpeed;
  }
  void setMoveSpeed(float speed) {
    
    moveSpeed = speed;
  }

  float getXpos() {
    
    return xPos;
  }
  float getYPos() {
    
    return yPos;
  }
  void setPos(float xCoord, float yCoord){
    
    xPos = xCoord;
    yPos = yCoord;
  }
    
  void move(){
    //println(floor(xPos),floor(yPos));
    xPos+=moveSpeed;
    yPos+=moveSpeed*cos(radians(xPos));
    
  }
  
  void updateStroke(){
    if(!isEnd){
      move();
    }
    if(xPos > width || xPos < 0 || yPos > height || yPos<0){
      isEnd = true;
    }

  }
  
}
