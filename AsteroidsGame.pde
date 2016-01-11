SpaceShip sack;
ArrayList <Asteroid> balls;
ArrayList <Bullet> franku = new ArrayList <Bullet>();
Star[] nyes = new Star[400];
boolean LEFTIsPressed = false;
boolean RIGHTIsPressed = false;
boolean UPIsPressed = false;
boolean shoot = false;
public void setup() 
{  
size(500,500);   
  balls = new ArrayList <Asteroid>();
  sack = new SpaceShip();
  
  for (int i = 0; i < nyes.length; i++)
  {
    nyes[i] = new Star();
  }
   for(int i = 0; i< 20; i++)
  {
    balls.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i<franku.size(); i++)
  {
    franku.get(i).move();
    franku.get(i).show();
  }
  for (int i = 0; i < nyes.length; i++)
  {
    stroke(1);
    nyes[i].show();
  }
  if(UPIsPressed == true)
  {
    sack.accelerate(0.15);
  }
  if(LEFTIsPressed == true)
  {
    sack.rotate(-10);
  }
  if(RIGHTIsPressed == true)
  {
    sack.rotate(10);
  }
  if(shoot == true)
  {
    franku.add(new Bullet(sack));
  }
  sack.show();
  sack.move();
  for(int i = 0; i <balls.size(); i++)
  {
  balls.get(i).show();
  balls.get(i).move();
}
for(int i = 0; i < balls.size(); i++)
{
  for(int j = 0; j<franku.size();j++)
  {
  if(dist(balls.get(i).getX(),balls.get(i).getY(),franku.get(j).getX(), franku.get(j).getY())<10)
{
  balls.remove(i);
 franku.remove(j);
  break;
}
}
}
}
public void keyPressed(){
    if (keyCode == UP) {
      UPIsPressed = true;
     
    }
    else if (keyCode == LEFT){
      LEFTIsPressed = true;
      
    }
    else if (keyCode == RIGHT){
      RIGHTIsPressed = true;
      
    }
      if (keyCode == DOWN){
      sack.setX((int)(Math.random()*500));
      sack.setY((int)(Math.random()*500));
      sack.setDirectionX(0);
      sack.setDirectionY(0);
      sack.setPointDirection((int)(Math.random()*360));
    }
    if (keyCode == ' '){
      shoot = true;
    }

  
}
public void keyReleased(){
  if(keyCode == UP )
  {
    UPIsPressed = false;
  }
  else if(keyCode == LEFT)
  {
    LEFTIsPressed = false;
  }
  else if(keyCode == RIGHT)
  {
    RIGHTIsPressed = false;
  }
  else if(keyCode == ' '){
    shoot = false;
  }
}
class SpaceShip extends Floater  
{   
 
    public SpaceShip()
    {
      myColor = 255;
      r = 255;
      g = 255;
      b = 255;
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8; 
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      myCenterX = 400;
      myCenterY= 250;
      myPointDirection = 0;
      myDirectionX = 0;
      myDirectionY = 0;
    }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myDirectionX = myDirectionX;
    myDirectionY = myDirectionY;
    

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}

}
class Bullet extends Floater
{
  public Bullet(SpaceShip sack)
  {
    fill(255);
    myCenterX = sack.getX();
    myCenterY = sack.getY();
    myPointDirection = sack.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + sack.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + sack.getDirectionY();
  }

  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  public void show()
  {
    ellipse((float)myCenterX, (float)myCenterY, 5 ,5);
  }
    public void move()
    {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    }
    }


class Asteroid extends Floater 
    {
      private double rotation;
        public Asteroid()
        {
        r = 192;
        g = 192;
        b = 192;
          corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] =-10;  
      yCorners[0] = 10;
      xCorners[1] = -10;
      yCorners[1] = -10;
      xCorners[2] = 10;
      yCorners[2] = -10;
      xCorners[3] = 10;
      yCorners[3] = 10;
      myCenterX = (int)(Math.random()*1000);
      myCenterY= (int)(Math.random()*650);
      myPointDirection = 0;
      myDirectionX = (int)(Math.random()*6)-3;
      myDirectionY = (int)(Math.random()*6)-3;
      rotation = Math.random();

        }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
    public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myPointDirection += rotation;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }  
    } 
    }
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor; 
  protected int r;
  protected int g;
  protected int b;
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(r,g,b);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star
{
  private int myX, myY;
  public Star()
  {

    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*700);
  }
  public void show()
  {
    fill(255,255,0);
    ellipse(myX, myY, 3, 3);
  }
}