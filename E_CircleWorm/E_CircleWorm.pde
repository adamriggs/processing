import java.util.Iterator;

int wWidth = 1280;
int wHeight = 1040;

ArrayList<Segment> unusedPool;
ArrayList<Segment> activePool;

Segment newSeg;
Segment prevSeg;

void setup() {
  size(wWidth, wHeight);
  background(0);
  frameRate(60);
  unusedPool = new ArrayList<Segment>();
  activePool = new ArrayList<Segment>();
}

void draw() {
  background(0);
  
  if(newSeg == null){
    
    newSeg = new Segment();
    newSeg.init(0, 0, random(10)+100, random(10)+100);
    
  } else if(unusedPool.size() == 0){
    
    prevSeg = newSeg;
    newSeg = new Segment();
    newSeg.init(prevSeg.x+1, prevSeg.y+1, checkRange(prevSeg.a), checkRange(prevSeg.b));
    
  } else if(unusedPool.size() > 0){
    
    prevSeg = newSeg;
    
    newSeg = new Segment();
    newSeg = unusedPool.get(0);
    unusedPool.remove(newSeg);
    
    newSeg.init(prevSeg.x+1, prevSeg.y+1, checkRange(prevSeg.a), checkRange(prevSeg.b));
  }
  
  activePool.add(newSeg);
  
  for(int i = 0; i < activePool.size(); i++){
    Segment seg = activePool.get(i);
    seg.run();
    if( seg.active == false ){
      activePool.remove(seg);
      unusedPool.add(seg);
    }
  }
  
  //saveFrame("frames/frame-####.jpg");
}

float checkRange(float num){
  float newNum = num + random(10)-5;
  float low = 10;
  float high = 100;
  
  if(num<low){
    newNum = low;
  }
  
  if(num>high){
    newNum = high;
  }
  
  return newNum;
}


//*****CLASSES

class Segment {
  PVector location;
  float x;
  float y;
  float a;
  float b;
  int lifespan;
  boolean active;
  
  Segment(){
    
    
  }
  
  void init(float X, float Y, float A, float B){
    x = X;
    y = Y;
    a = A;
    b = B;
    lifespan = 255;
    active = true;
    run();
  }
  
  void run(){
    ellipse(x, y, a, b);
    lifespan--;
    if(lifespan <=0 ){
      active = false;
    }
  }
  
//  Object cloneMe(){
//   //return {X:x, Y:y, A:a, B:b};
//    
//  }
  
}
