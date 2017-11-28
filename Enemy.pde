
public class Enemy extends Rectangle{

  
    PImage img;
    
    float dx = 0, dy = 0, speed = 5;
    
    int enemyType = 0; // 0 for small, 1 for big

    public Enemy(float x, float y, int enemyType){
      super(x,y,0,0);
      this.enemyType = enemyType;
      
      if(enemyType == 0){
        
        img = loadImage("assets/enemy.png");
        this.setWidth(75);
        this.setHeight(56);
        
      }else if(enemyType == 1){
        
        img = loadImage("assets/big_enemy.png");
        this.setWidth(97);
        this.setHeight(120);
        
      }
      
      
    }
    
    
    public void render(){
      
      image(img, this.getX(), this.getY(), this.getWidth(), this.getHeight());
    
    }
    
    public void update(Rectangle player){
      
      if(player.getX() > this.getX()){dx=1;}
      if(player.getX() < this.getX()){dx=-1;}
      
      if(player.getY() > this.getY()){dy=1;}
      if(player.getY() < this.getY()){dy=-1;}
      
      this.setX(this.getX()+(dx*speed));
      this.setY(this.getY()+(dy*speed));
      
    }
    

}