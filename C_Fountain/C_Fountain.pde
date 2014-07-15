import java.util.Iterator;

int wWidth = 640;
int wHeight = 480;
ParticleSystem ps;

void setup() {
  size(wWidth, wHeight);
  background(0);
  ps = new ParticleSystem(new PVector(width/2, 100));
}

void draw() {
  background(0);
  for(int i = 0; i < 100; i++){
    ps.addParticle();
  }
  ps.run();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void run(){
    Iterator it = particles.iterator();
    while(it.hasNext()){
      Particle p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
      }
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    stroke(175, lifespan);
    fill(175, lifespan);
    ellipse(location.x, location.y, 2, 2);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

