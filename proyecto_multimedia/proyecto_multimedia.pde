

PImage img1, img2;
int x= mouseX;
 int y= mouseY;
void setup(){

size(600, 400);

img1 = loadImage("welcome.jpg"); 
img1.resize(600, 400);
img2 = loadImage("fondo.png");
img2.resize(600, 400);
background(img1);
textSize(32);
fill(0, 102, 153);
text(".::ENTRAR::.", 200, 370);
}

void draw(){  
  
if(mousePressed==true){
  
 background(img2); 
}
  println(mouseX + " : " + mouseY);
}

void mouseClicked() {
  
}

