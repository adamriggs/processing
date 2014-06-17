//http://mos.futurenet.com/pdf/computerarts/ART149_tut_4.pdf

int x1, y1;
int x2, y2;
int x3, y3;

void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  // background(200,200,200);
  frameRate(200);
  x1=width/2;
  y1=height/2;
  x2=x1;
  y2=y1;
  x3=x1;
  y3=y1;
}

void draw() {
  for (int i=0;i<100;i++) {
    x2=constrain((x2-20+round(random(40))), -30, width+30);
    y2=constrain((y2-20+round(random(40))), -30, height+30);
    smooth();
    fill(50, 50, 100-i);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
    x3=x2;
    y3=y2;
    //println(x3+", "+y3);
  }
  //noLoop();
}

