SpaceShip nyes = new SpaceShip();
Stars [] balls;
 ArrayList<Asteroid> sacks; 
 boolean leftPressed = false;
boolean rightPressed = false; 
boolean upPressed = false;
float d; 
public void setup() 
{
  size(500,500);
  balls = new Stars[500];
  for(int i = 0; i<balls.length; i++)
  {
    balls[i] = new Stars();
  }
  sacks = new ArrayList<Asteroid>();
  for(int p = 0; p<30; p++)
  {
    sacks.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for(int l = 0; l<balls.length; l++)
  {
    stroke(1);
    balls[l].show();
  }
  if(upPressed == true)
  {
    nyes.accelerate(0.2);
  }
  if(rightPressed == true)
  {
    nyes.rotate(15);
  }
  if(leftPressed == true)
  {
    nyes.rotate(-15);
  }
  nyes.show();
  nyes.move();
  for(int z = 0;z< sacks.size(); z++)
  {
    sacks.get(z).show();
    sacks.get(z).move();
  }
  for (int h = 0; h < sacks.size(); h++) {
    d = dist(sacks.get(h).getX(),sacks.get(h).getY(),nyes.getX(),nyes.getY());
    if(d<20)
      sacks.remove(h);
  }
  
}
public void keyPressed()
{
   if(keyCode == UP)
   {
     upPressed = true;
   }
   if(keyCode == RIGHT)
   {
     rightPressed = true;
   }
   if(keyCode == LEFT)
   {
     leftPressed = true;
   }
   if(keyCode == DOWN)
   {
    nyes.setX((int)(Math.random()*500));
    nyes.setY((int)(Math.random()*500));
    nyes.setDirectionX(0);
    nyes.setDirectionY(0);
    nyes.setPointDirection((int)(Math.random()*360));
   }
}
public void keyReleased()
{
   if(keyCode == UP)
   {
     upPressed = false;
   }
   if(keyCode == RIGHT)
   {
     rightPressed = false;
   } 
   if(keyCode == LEFT)
   {
     leftPressed = false; 
   }
}
class Stars 
{
  private int myX,myY;
  public Stars()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show()
  {
    fill(255,255,0);
    ellipse(myX,myY,3,3);
  }
}
class SpaceShip extends Floater  
{   
   SpaceShip()
   {
    myColor = 255;
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8; 
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8; 
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return(int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return(int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return(double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return(double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return(double)myPointDirection;}
}
class Asteroid extends Floater
{
  
  private int sPeed, nDegreesOfRotation;
  Asteroid()
  {
    myColor = 192; 
    corners = 11;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 2;
    yCorners[0] = 8;
    xCorners[1] = 8;
    yCorners[1] = 7; 
    xCorners[2] = 9;
    yCorners[2] = 5; 
    xCorners[3] = 9;
    yCorners[3] = -5; 
    xCorners[4] = 8;
    yCorners[4] = -7;
    xCorners[5] = 2;
    yCorners[5] = -8;
    xCorners[6] = -8;
    yCorners[6] = -7;
    xCorners[7] = -9;
    yCorners[7] = -5; 
    xCorners[8] = -9;
    yCorners[8] = 5;
    xCorners[9] = -8;
    yCorners[9] = 7; 
    xCorners[10] = 2;
    yCorners[10] = 8;  
    myDirectionX = (Math.random()*3-1.5);
    myDirectionY = (Math.random()*3-1.5);
    myCenterX = (Math.random()*width);
    myCenterY = (Math.random()*height);
    nDegreesOfRotation =(int)(Math.random()*3-1);
}
public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myPointDirection+= nDegreesOfRotation;
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
  public int getX(){return(int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return(int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return(double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return(double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return(double)myPointDirection;}
}
//class Bullet extends Floater{}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
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
    fill(myColor);   
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

