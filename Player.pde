
public class Player extends Rectangle{

  
    PImage img;
    
    float dx = 0, dy = 0, speed = 5;
    
    boolean isFiring;
    
    int lives = 3;

    public Player(float x, float y, float rwidth, float rheight){
      super(x,y,rwidth,rheight);
      
      img = loadImage("assets/ship.png");
    }
    
    
    public void render(){
    
      image(img, this.getX(), this.getY(), this.getWidth(), this.getHeight());
      
      textSize(32);
      fill(50,50,255);
      text("Lives: "+lives, width-150, 50);
    
    }
    
    public void update(){
      
      
      pollInput();
      
      
      this.setX(this.getX()+(dx*speed));
      this.setY(this.getY()+(dy*speed));
      
    }
    
    private void pollInput(){
      
      if (mousePressed == true) {
          setIsFiring(true);
      }else{
          setIsFiring(false);
      }
      
    
      if (keyPressed) {
        
        if (key == 'a' || key == 'A') {
          
          dx = -1;
          
        }else if (key == 'd' || key == 'D') {
          
          dx = 1;
          
        }else{
          dx = 0;
        }
        
        if (key == 'w' || key == 'W') {
          
          dy = -1;
          
        }else if (key == 's' || key == 'S') {
          
          dy = 1;
          
        }else{
        
          dy = 0;
          
        }
        
        speed = 5;
        
      }else if(!keyPressed){
      
        speed = 0;  
        
      }
    
    }
    
    public int getLives(){return lives;}
    
    public void setLives(int val){lives=val;}
    
    public boolean isFiring(){return isFiring;}
    
    public void setIsFiring(boolean val){isFiring=val;}

}