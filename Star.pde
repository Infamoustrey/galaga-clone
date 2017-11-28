
public class Star extends Rectangle{

  
  private float speed;

  public Star() {
  
    super(random(0,width),0,3,3);
    
    speed = random(0,20);
  
  }
  
  
  public void render(){
  
    fill(255);
    rect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
    
  }
  
  public void update(){
  
    this.setY(this.getY()+speed);
  
  }

}