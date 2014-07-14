int wWidth = 1280;
int wHeight = 720;
Particle p;

void setup(){
  size(wWidth, wHeight);
  background(0);
  p = new Particle(new PVector(width/2, 10));
}

void draw(){
  clear();
  p.run();
  if(p.isDead()){
    println("particle is dead.");
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l){
    location = l.get();
    acceleration = new PVector(0, 0.05);
    velocity = new PVector();
    lifespan = 255;
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  void display(){
    stroke(0, lifespan);
    fill(175, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }
  
  boolean isDead(){
    if(lifespan < 0.0){
      return true;
    } else {
      return false;
    }
  }
}

