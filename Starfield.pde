Star [] galaxy;
void setup()
{
  size (500,500);
  galaxy = new Star[100];
  for(int i = 0; i < galaxy.length - 1; i++)
  {
    galaxy[i] = new Star();
  }
  galaxy[galaxy.length-1] = new oddBall();
}
void draw()
{
  background(0);
  for (int i = 0; i < galaxy.length; i++)
  {
    galaxy[i].move();
    galaxy[i].show();
    galaxy[i].reset();
  }
}
class Star
{
  float xPos, yPos;
  float direction, speed;
  float size = 10;
  int myColor = color(0,0,0);
  float helper = 0;
  Star()
  {
    xPos = height/2;
    yPos = width/2;
    speed = (float)(Math.random()*5)+5;
    direction = (float)Math.random()*361;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  void move()
  {
    //moves the ball relative to its speed
   xPos += ((float)Math.cos(direction))*speed;
   yPos += ((float)Math.sin(direction))*speed;
  }
  void show()
  {
    //increases ball size as it gets closer to the edge
    size = dist(xPos, yPos, height*0.5, width*0.5); 
    fill(myColor);
    ellipse(xPos, yPos, size/4,size/4);
  }
  void reset()
  {
    // checks if object goes outside screen and resets it and chooses a new direction if it is
    if (xPos > 500)
    {
      xPos = height/2;
      yPos = width/2;
      direction = (float)Math.random()*361;
    }
    else if (yPos > 500)
    {
      xPos = height/2;
      yPos = width/2;
      direction = (float)Math.random()*361;
    }
    else if (xPos< 0)
    {
      xPos = height/2;
      yPos = width/2;
      direction = (float)Math.random()*361;
    }
    else if (yPos < 0)
    {
      xPos = height/2;
      yPos = width/2;
      direction = (float)Math.random()*361;
    }
    
  }
}
class oddBall extends Star
//ufo
{
  oddBall()
  {
    myColor = color(100,100,100);
  }
  void show()
  {
    fill(myColor);
    circle(xPos,yPos,50);
    ellipse(xPos, yPos+10,100, 30);
    speed = 5;
  }
  void reset()
  //changes its direction if it is going outside of the screen
  {
    if (xPos > 500)
    {
      direction = (float)Math.random()*361;
    }
    else if (yPos > 500)
    {
      direction = (float)Math.random()*361;
    }
    else if (xPos < 0)
    {
      direction = (float)Math.random()*361;
    }
    else if (yPos < 0)
    {
      direction = (float)Math.random()*361;
    }
    // checks if object goes outside screen and resets it
    if (yPos < -20)
    {
      xPos = 50;
      yPos = 50;
    }
    if (xPos < -40)
    {
      xPos = 50;
      yPos = 50;
    }
    if (yPos > 520)
    {
      xPos = 450;
      yPos = 450;
    }
    if (xPos > 540)
    {
      xPos = 450;
      yPos = 450;
    }
  }
}
