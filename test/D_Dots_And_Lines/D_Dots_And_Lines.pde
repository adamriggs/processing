int x1, y1, x2, y2;

void setup(){
  size(480, 360);
  x1=400;
  y1=400;
  
  x2=100;
  y2=100;
}

void draw(){
  
  x1=int(random(width));
  y1=int(random(height));
  ellipse(x1,y1,5,5);
  
  line(x1,y1,x2,y2);
  
  x2=x1;
  y2=y1;
  //ellipse(x2,y2,5,5);
}
