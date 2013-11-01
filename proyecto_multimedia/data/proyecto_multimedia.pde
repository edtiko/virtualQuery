
import ddf.minim.*;
 
Minim minim;
AudioPlayer song1, song2;
PImage img1, img2,img3, img4, img5, img6, img7, img8, img9, img, nino1, nino2, nino3;

MovingCircle myCircle ;
MovingCircle myCircle2 ;
MovingCircle myCircle3 ;
boolean stop;
int press=0;
void setup(){
  

size(800, 600);

 smooth();
    myCircle=new MovingCircle(50,50,10);
   myCircle2= new MovingCircle(50,50,10);
   myCircle3= new MovingCircle(50,50,10);
   stop=true;
img1 = loadImage("Portada.png"); 
img1.resize(800, 600);
img2 = loadImage("D1.png"); 
img2.resize(800, 600);
img3 = loadImage("D2.png"); 
img3.resize(800, 600);
img4 = loadImage("D3.png"); 
img4.resize(800, 600);
img5 = loadImage("D4.png"); 
img5.resize(800, 600);
img6 = loadImage("D5.png"); 
img6.resize(800, 600);
img7 = loadImage("D6.png"); 
img7.resize(800, 600);
img8 = loadImage("D7.png");
img8.resize(800, 600);
img9 = loadImage("fondo.png");
img9.resize(800, 600);
img = img1;
background(img);
textSize(32);
fill(0, 102, 153);
text(".::ENTRAR::.", 300, 570);
 minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song1 = minim.loadFile("naturaleza.mp3",512);
  song2 = minim.loadFile("ninos.mp3",512);

}

void draw(){  
  
if(mousePressed==true){
  //img=img2;
 //background(img); 
}

if(img==img9){
   //background(img); 
// nino1 = loadImage("nino.png");
//nino2 = loadImage("nino2.png");
//nino3 = loadImage("nino3.png");
//nino1.resize(50,50);
//nino2.resize(50,50);
//nino3.resize(50,50);

  song1.play();
  song2.play();
  
//    float x,y;
//    xpos=pmouseX;
//    ypos=pmouseY;
//    
//    
//  // 
//    x=map(xpos,0, width,(width/2)+((im1width-width)/2),(width/2)-((im1width-width)/2));
//    y=map(ypos,0, height,(height/2)+((im1height-height)/2),(height/2)-((im1height-height)/2));
//    
//    translate(x, y);
//image(nino1, 300, 310);
//image(nino2, 400, 310);
//image(nino3, 500, 310);
 
 // x=mouseX;
  //y=mouseY;
//  if(abs(x-xpos)>xvel) {
// 
//    if (x>xpos) {
//      xpos+=xvel;
//    }
//    else
//    {
//      xpos-=xvel;
//    }
//  }
//  if(abs(y-ypos)>yvel) {
//    if (y>ypos) {
//      ypos+=yvel;
//    }
//    else
//    {
//      ypos-=yvel;
//    }
//  }
// 
//  image(nino1,map(xpos,0, width,(width/2)+((im1width-width)/2),(width/2)-((im1width-width)/2)), map(ypos,0, height,(height/2)+((im1height-height)/2),(height/2)-((im1height-height)/2)));
//   image(nino2,map(xpos,0, width,(width/2)+((im2width-width)/2),(width/2)-((im2width-width)/2)), map(ypos,0, height,(height/2)+((im2height-height)/2),(height/2)-((im2height-height)/2)));
//    image(nino3,map(xpos,0, width,(width/2)+((im3width-width)/2),(width/2)-((im3width-width)/2)), map(ypos,0, height,(height/2)+((im3height-height)/2),(height/2)-((im3height-height)/2)));

 // update the position of the circles
  if(stop){
  myCircle.update();
myCircle3.update();  
}
  myCircle2.update();
 
  // check for collisions with the walls
  myCircle.checkCollisions();
  myCircle2.checkCollisions();
  myCircle3.checkCollisions();
   
  // and draw each one
  myCircle.drawCircle();
  myCircle2.drawCircle();
  myCircle3.drawCircle();
}
  println(mouseX + " : " + mouseY);


   
}

void mousePressed(){
  
  if(img==img9){
    stop=false;
myCircle.x=(width/2);
myCircle.y=150;
myCircle3.x=(width/2)+30;
myCircle3.y=150;
  }
  else if(img==img8){
    img=img9;
  }
  else if(img==img7){
    img=img8;
  }
  else if(img==img6){
    img=img7;
  }
  else if(img==img5){
    img=img6;
  }
  else if(img==img4){
    img=img5;
  }
  else if(img==img3){
    img=img4;
  }
  else if(img==img2){
    img=img3;
  }
  else if(img==img1){
    img=img2;
  }
  
 //background(img);
  

}

 
// this is the definition for our custom MovingCircle object,
// start with the name of the class (or type of object)
 
class MovingCircle {
 
  // any variable declared here will be properties of
  // objects of this type 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float circleSize;
  PImage img;
 
  // this special function declaration has the same name
  // as the class (MovingCircle) and it has no return type. This
  // is known as the constructor and it's run when an 
  // object of this type is created.
   
  MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;
    img = loadImage("nino.png"); 
    xSpeed = random(-2, 2);
    ySpeed = random(-2, 2);
     
  }
 
  // update adds the speed to the position, making
  // our circle move around.
  void update() {
    x += xSpeed;
    y += ySpeed; 
  }
   
  // this function checks to see if our circle has gone off
  // the edge of the screen, and if so reverses the speed
   
  void checkCollisions() {
     
    float r = circleSize/2;
     
    if ( (x<r) || (x>width-r)){
      xSpeed = -xSpeed;
    } 
     
    if( (y<r) || (y>(height/2)-r)) {
      ySpeed = -ySpeed; 
    }
     
  }
   
  void drawCircle() {
     
    fill(255);
    //ellipse(x, y, circleSize, circleSize);
    image(img,x,y);
     
  }
   
   
}


