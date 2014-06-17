//I'm just trying to make some ellipses move around the screen, yo


int wWidth = 1280;
int wHeight = 720;
float startVelocity = 5;
float velocity = startVelocity;
float dV = 0;
double startAngle = random(0, 360) * Math.PI/180;
float angle = (float) startAngle;
float eWidth = 10;
float eHeight = 10;
//float eX = random(0, wWidth);
//float eY = random(0, wHeight);
float eX = wWidth/2;
float eY = wHeight/2;

void setup() {
  size(wWidth, wHeight);
  background(0);
  //fill(#FFCC00);
  fill(random(0,255),random(0,255),random(0,255));
}


void draw() {
//  print("eX=="+eX+"\n");
//  print("eY=="+eY+"\n");
//  print("*****\n");
  
  ellipse(eX, eY, eWidth, eHeight);
  
  dV = random(0,.5);
  dV=.4;
  //if(random(0,1)>=.5){dV*=-1;}
  velocity += dV;
  angle += random(0, 10) * Math.PI/180;
  
  eX += cos(angle) * velocity;
  eY += sin(angle) * velocity;
  
  if(eX < 0 || eX > wWidth || eY < 0 || eY > wHeight){
    eX = wWidth/2;
    eY = wHeight/2; 
    velocity = startVelocity;
    fill(random(0,255),random(0,255),random(0,255));
  }
  
}

