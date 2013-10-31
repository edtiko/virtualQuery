
import ddf.minim.*;
 
Minim minim;
AudioPlayer song1, song2;
PImage img1, img2, img, nino1, nino2, nino3;
int x= mouseX;
 int y= mouseY;
void setup(){

size(800, 600);

img1 = loadImage("welcome.jpg"); 
img1.resize(800, 600);
img2 = loadImage("fondo.png");
img2.resize(800, 600);
img = img1;
background(img);
textSize(32);
fill(0, 102, 153);
text(".::ENTRAR::.", 200, 370);
 minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song1 = minim.loadFile("naturaleza.mp3",512);
  song2 = minim.loadFile("ninos.mp3",512);


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
image(nino1, 300, 310);
image(nino2, 400, 310);
image(nino3, 500, 310);
  song1.play();
  song2.play();
}
  println(mouseX + " : " + mouseY);
}

void mouseClicked() {
  
}

