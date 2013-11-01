class Nino{
  int x,y;
  String name;  
  PImage nino; 
  String colorCamisa;
  
  public Nino(int x,int y,String name,String colorCamisa){
    this.x =x;
    this.y = y;
    this.name = name;
    nino = loadImage(name);
    this.colorCamisa = colorCamisa;
  }  
  
  public void show(){
    image(nino,x,y);
  }  

  public void move(){
    x++;
    y++;    
    image(nino,x,y);    
  }
  
  public void centrar(int maxY){
    if(y <= maxY){
      y++;
    }
    image(nino,x,y);    
  }
  
  public void resetPosicion( int y){
    this.y = y;        
  }
}

