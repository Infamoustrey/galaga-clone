
Player player;

ArrayList<Enemy> enemyList;

ArrayList<Star> starArray;

ArrayList<Bullet> bulletList;

int timeLastBulletFired, timeOfLastTick_fire;

int timeLastEnemySpawned, timeOfLastTick_enemy;

void setup(){

  size(800, 600);
  
  background(0);

  init();

}

void draw(){

  background(0);
 
  update();
  
  render();
  
}

void init(){

  starArray = new ArrayList<Star>();
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  
  for(int i = 0; i < 100; i++){
  
       starArray.add(new Star());
    
  }
  
  
  player = new Player(50,500,75,75);

}

void update(){

  //Add 5 new stars
  for(int i = 0; i < 2; i++){
       starArray.add(new Star());
  }
  
  //Move Stars
  for(int i = 0; i < starArray.size(); i ++){
    Star star = starArray.get(i);
    
    if(star.getY() > height){
      starArray.remove(i);
    }else{
      star.update();
    }
  }
  
  for(Bullet bullet: bulletList){
      bullet.update();
  }
  
  for(Enemy enemy: enemyList){
      enemy.update(player);
  }
  
  player.update();

  if(enemyList.size() < 5){
  
    reinforcements();
    
  }

  if(player.isFiring()){
    fire();
  }

}

void render(){

  for(Star star: starArray){
      star.render();
  }
  
  for(Bullet bullet: bulletList){
      bullet.render();
  }
  
  for(Enemy enemy: enemyList){
      enemy.render();
  }
  
  player.render();

}

void reinforcements(){

  
  timeLastEnemySpawned+=millis()-timeOfLastTick_enemy;
   
  if(timeLastEnemySpawned > 4000){
  
    timeLastEnemySpawned = 0;
    
    // Spawn an Enemy
    
    enemyList.add(new Enemy(random(0,width), -random(0,200), (int)random(0,2)));
    
  }
  
  timeOfLastTick_enemy = millis();
  

}

void fire(){
  
  timeLastBulletFired+=millis()-timeOfLastTick_fire;
   
  if(timeLastBulletFired > 500){
  
    timeLastBulletFired = 0;
    
    // Fire a Bullet
    bulletList.add(new Bullet(player));
    
  }
  
  timeOfLastTick_fire = millis();
  
}