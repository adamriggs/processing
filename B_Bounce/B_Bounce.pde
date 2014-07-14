//make a ball bounce around using a class for the ball
int wWidth = 1280;
int wHeight = 720;
double maxD = Math.sqrt((wWidth*wWidth) + (wHeight*wHeight));
Ball ball = new Ball();

void setup(){
  size(wWidth, wHeight);
  background(0);
  //fill(#FFCC00);
  fill(random(0,255),random(0,255),random(0,255));
}

void draw(){
  clear();
  ball.draw();
}


class Ball{
  float startVelocity = 5;
  float velocity = startVelocity;
  float dV = 0;
  double startAngle = random(0, 360) * Math.PI/180;
  float angle = (float) startAngle;
  float maxA = (float) Math.PI;
  float eWidth = 2;
  float eHeight = 2;
//  float eX = random(0, wWidth);
//  float eY = random(0, wHeight);
  float eX = wWidth/2;
  float eY = wHeight/2;
  
  
  void draw(){
    ellipse(eX, eY, eWidth, eHeight);
    
    float[] distances = {eY, wWidth - eX, wHeight - eY, eX};
    distances = sort(distances);
    float curD = (distances[0]+distances[1])/2;
    curD = distances[0];
    double tmpA = maxA - ((maxD-curD)/maxD);
//    println("tmpA=="+tmpA);
    tmpA = tmpA * Math.PI/180;
    angle += (float) tmpA;
    if(angle > Math.PI*2){angle -= Math.PI*2;}
    
//    println("maxD=="+maxD);
//    println("curD=="+curD);
//    println("curD/maxD=="+(curD/maxD));
//    println("(maxD - (curD/maxD))=="+(maxD - (curD/maxD)));
//    println("(curD/maxD)/maxD)=="+((curD/maxD)/maxD));
//    println("tmpA=="+tmpA);
//    println("angle=="+angle);
//    println("*****");
    
    eX += cos(angle) * velocity;
    eY += sin(angle) * velocity;
    
    if(eX < 0 || eX > wWidth || eY < 0 || eY > wHeight){
      eX = wWidth/2;
      eY = wHeight/2; 
      velocity = startVelocity;
      fill(random(0,255),random(0,255),random(0,255));
    }
  }
}

