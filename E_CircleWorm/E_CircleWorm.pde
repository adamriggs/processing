import java.util.Iterator;

int wWidth = 1280;
int wHeight = 960;

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
    newSeg.init(new PVector(0,0), new PVector(random(10)+100, random(10)+100));
    
  } else if(unusedPool.size() == 0){
    
    prevSeg = newSeg;
    newSeg = new Segment();
    newSeg.init(newCoords(prevSeg.loc), newShape(prevSeg.shape));
    
  } else if(unusedPool.size() > 0){
    
    prevSeg = newSeg;
    
    newSeg = new Segment();
    newSeg = unusedPool.get(0);
    unusedPool.remove(newSeg);
    
    newSeg.init(newCoords(prevSeg.loc), newShape(prevSeg.shape));
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

PVector newCoords(PVector Loc){
  PVector loc = new PVector();
  loc.x = Loc.x + random(5)-1;
  loc.y = Loc.y + random(5)-1;
  
  return loc; 
}

PVector newShape(PVector Shape){
  PVector shape = new PVector(Shape.x + random(10)-5, Shape.y + random(10)-5);
  int low = 10;
  int high = 100;
  
  if(shape.x<low){
    shape.x = low;
  }
  if(shape.y<low){
    shape.y = low;
  }
  
  if(shape.x>high){
    shape.x = high;
  }if(shape.y>high){
    shape.y = high;
  }
  
  return shape;
}


//*****CLASSES

class Segment {
  PVector loc;
  PVector shape;
  int lifespan;
  boolean active;
  color c;
  
  Segment(){
    
  }
  
  void init(PVector Loc, PVector Shape){
    loc = Loc;
    shape = Shape;
    lifespan = 128;
    active = true;
    run();
    c = (255);
  }
  
  void run(){
    fill(c);
    stroke(255);
    ellipse(loc.x, loc.y, shape.x, shape.y);
    lifespan--;
    if(lifespan <=0 ){
      active = false;
    }
  }
}
