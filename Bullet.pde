
public class Bullet extends Rectangle{

  
  private float speed;

  public Bullet(Rectangle player) {
  
    super(player.getX()+player.getWidth()/2,player.getY(),5,5);
    
    speed = 10;
  
  }
  
  
  public void render(){
  
    fill(255,0,0);
    rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
    
  }
  
  public void update(){
  
    this.setY(this.getY()-speed);
  
  }

}