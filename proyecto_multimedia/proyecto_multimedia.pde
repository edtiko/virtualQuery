import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ddf.minim.*;
  
  PImage b, img;
  List<Nino> ninos;
  int diapositiva = 1;
  int movNubes = -152;
  boolean bloquear = true;
  int posxinicialninos = (height/2) + 150;
  Minim minim;
  AudioPlayer song1, song2;
  
  Map<Integer,String> textoPorEscena = new HashMap<Integer,String>();
  {
    textoPorEscena.put(7, "Donde están los niños?");
    textoPorEscena.put(8, "Vamos a llamar a todos los niños");
    textoPorEscena.put(9, "En el lenguaje SQL para obtener todos los niños usaremos");
    textoPorEscena.put(10, "SELECT * FROM niños");
    
    textoPorEscena.put(13, "Ahora obtengamos los niños de camisa azul");
    textoPorEscena.put(14, "Para ello usamos en el condicional WHERE camisa = Azul");
    textoPorEscena.put(15, "SELECT * FROM niños WHERE camisa = Azul");
    textoPorEscena.put(18, "VirtualQuery  \n Edwin Gómez \n Alexander Guerrero \n Melissa García \n Julian Millan \n Luis Madeira \n Miguel García \n Moises Vargas");
  }
  
  void setup() {
    size(626,458);
    b = loadImage("fondo.png");        
    PFont f = createFont("Georgia", 36);
    textFont(f, 20);
    cargarNinos();
    minim = new Minim(this);
  // this loads mysong.wav from the data folder
  song1 = minim.loadFile("naturaleza.mp3",512);
  song2 = minim.loadFile("ninos.mp3",512);
  }

  void draw() {
    image(b,0,0);
    image(loadImage("left.png"),0,420);
    image(loadImage("right.png"),590,420);
    moverNubes();
    
    if (mousePressed) {      
      if(bloquear){
        if(mouseX > 0 && mouseX < 32 && mouseY > 420 && diapositiva >= 0){
          diapositiva--;
        }else if(mouseX > 590 && mouseY > 420 && diapositiva < 19){
          diapositiva++;
        }
        bloquear = !bloquear;
      }      
    }
     if(diapositiva >= 7 && diapositiva <= 18){
     song1.play();
      song2.play();
    }
    if(diapositiva > 0 && diapositiva < 7){
      img = loadImage("D"+diapositiva+".png"); 
      img.resize(626,458);
      background(img);
         image(loadImage("left.png"),0,420);
    image(loadImage("right.png"),590,420);
    }else if(diapositiva >= 7 && diapositiva < 11){      
      text(textoPorEscena.get(diapositiva), 50, 150);
     
    }else if(diapositiva == 11){
      renderNinos(false);
    }else if(diapositiva == 12){      
      renderNinos(true);      
    }else if(diapositiva >= 13 && diapositiva < 16){
      text(textoPorEscena.get(diapositiva), 50, 150);
    }else if(diapositiva == 16){
      renderNinos(false);
    }else if(diapositiva == 17){
      Map<String,String> condicional =  new HashMap<String,String>();
      condicional.put("colorCamisa","azul");
      renderNinos(condicional);
    }
    else if(diapositiva == 18){
      text(textoPorEscena.get(diapositiva), 250, 150);
    }
   
  }
  
  void renderNinos(boolean centrar){
    for (Nino nino : ninos) {
      nino.show();
      if(centrar){
        nino.centrar(posxinicialninos+150);
      }else{
        nino.resetPosicion(posxinicialninos);
      }
    }
  }
  
  void renderNinos(Map<String,String> condiciones){
    for (Nino nino : ninos) {
      nino.show();
      if(condiciones != null && nino.colorCamisa.equals(condiciones.get("colorCamisa"))){
        nino.centrar(posxinicialninos+150);
      }else{
        nino.resetPosicion(posxinicialninos);
      }
    }
  }
  
  void cargarNinos(){
    ninos = new ArrayList<Nino>();
    ninos.add(new Nino(70,20, "N1.png", "azul"));
    ninos.add(new Nino(140,20, "N2.png", "azul"));
    ninos.add(new Nino(210,20, "N3.png", "azul"));
    ninos.add(new Nino(280,20, "N4.png", "rojo"));
    ninos.add(new Nino(350,20, "N5.png", "rojo"));
    ninos.add(new Nino(420,20, "N6.png", "azul"));
  }
  
  void moverNubes(){        
    if(movNubes > 626){
      movNubes = -152;
    }
    image(loadImage("nube1.png"),movNubes++,0);
  }
  
  void mouseReleased() {
    bloquear = !bloquear;
  }  
 
