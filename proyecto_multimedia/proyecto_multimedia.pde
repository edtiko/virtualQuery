

PImage img1, img2, img, nino1, nino2, nino3;
int x= mouseX;
 int y= mouseY;
void setup(){

size(600, 400);

img1 = loadImage("welcome.jpg"); 
img1.resize(600, 400);
img2 = loadImage("fondo.png");
img2.resize(600, 400);
img = img1;
background(img);
textSize(32);
fill(0, 102, 153);
text(".::ENTRAR::.", 200, 370);
}

void draw(){  
  
if(mousePressed==true){
  img=img2;
 background(img); 
}

if(img==img2){
 nino1 = loadImage("nino.png");
nino2 = loadImage("nino2.png");
nino3 = loadImage("nino3.png");
nino1.resize(50,50);
nino2.resize(50,50);
nino3.resize(50,50);
image(nino1, 200, 210);
image(nino2, 270, 210);
image(nino3, 350, 210);
}
  println(mouseX + " : " + mouseY);
}

void mouseClicked() {
  
}

