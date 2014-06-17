PImage img;

void setup(){
  //img=loadImage("HOHOHO_venn.PNG");
  //img=loadImage("purple-rain-emotional-camel.jpg");
  img=loadImage("megan_is_awesome.jpg");
  size(img.width,img.height);
  background(0);
  image(img, 0, 0);
  loadPixels();
}

void draw(){
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D pixel location
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r = red   (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue  (img.pixels[loc]);
      // Change brightness according to the mouse here
      float adjustBrightness = (random(127)+127)/255;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      // Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      // Make a new color and set pixel in the window
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  // When we are finished dealing with pixels
  updatePixels(); 
}
