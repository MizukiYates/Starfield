Star [] galaxy;
void setup()
{
  size (500,500);
  galaxy = new Star[100];
  for(int i = 0; i < galaxy.length; i++)
  {
    galaxy[i] = new Star();
  }
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
  int myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  float helper = 0;
  Star()
  {
    xPos = height/2;
    yPos = width/2;
    speed = (float)Math.random()*5;
    direction = (float)Math.random()*361;
  }
  void move()
  {
   xPos += ((float)Math.cos(direction))*speed;
   yPos += ((float)Math.sin(direction))*speed;
  }
  void show()
  {
    size = dist(xPos, yPos, height*0.5, width*0.5);
    fill(myColor);
    ellipse(xPos, yPos, size/4,size/4);
  }
  void reset()
  {
    if (xPos > 500)
    {
      xPos = height/2;
      yPos = width/2;
    }
    else if (yPos > 500)
    {
      xPos = height/2;
      yPos = width/2;
    }
    else if (xPos< 0)
    {
      xPos = height/2;
      yPos = width/2;
    }
    else if (yPos < 0)
    {
      xPos = height/2;
      yPos = width/2;
    }
    
  }
}
