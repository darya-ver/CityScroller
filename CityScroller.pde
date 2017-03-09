ArrayList <Building> buildings = new ArrayList <Building>();

Person player1;
public void setup()
{
  size(500,500);

  buildings.add(new Building(width));

  for(int i = 1; i<5; i++)
  {
    buildings.add(i, new Building(buildings.get(i-1)));
  }

  player1 = new Person();
}

public void draw()
{
  background(0);

  backgroundScrolling();

  player1.show();
  player1.jump();
}

public void backgroundScrolling()
{
  for(Building b : buildings)
  {
    b.move();
    b.show();
  }

  if(buildings.get(0).isOffScreen()){buildings.get(0).changeX(buildings.get(4));}
  if(buildings.get(1).isOffScreen()){buildings.get(1).changeX(buildings.get(0));}
  if(buildings.get(2).isOffScreen()){buildings.get(2).changeX(buildings.get(1));}
  if(buildings.get(3).isOffScreen()){buildings.get(3).changeX(buildings.get(2));}
  if(buildings.get(4).isOffScreen()){buildings.get(4).changeX(buildings.get(3));}

  fill(30,0,150);
  rect(0,height-40,width,40);
}

class Person
{
  private int myX, myY;
  boolean jumped, up;

  Person()
  {
    myX = 50;
    myY = height - 100;
    jumped = up = true;
  }

  void show()
  {
    strokeWeight(20);
    stroke(0);
    line(myX, myY, myX, myY+100);

    noStroke();
    fill(255);
    ellipse(myX, myY, 10, 20);

  }

  void jump()
  {
    //jumped = false;
    changeUp();
    if(up == true){myY -= 3;}
    else{myY += 3;}
    
  }

  void changeUp()
  {
    if(myY < height - 140){up = false;}
    else if(myY > height-100){up = true;}
  }
}

class Building
{
  private int myX, myY, myWidth, myHeight;

  Building(int x)
  {
    myHeight = (int)(Math.random()*200+200);
    myWidth = (int)(Math.random()*100+100);

    // myHeight = 100;
    // myWidth = 10;

    myX = x;
    myY = height - myHeight;
    
  }
  
  public int getX(){return myX;}
  public int getY(){return myY;}
  public int getWidth(){return myWidth;}
  public int getHeight(){return myHeight;}
  
  Building(Building bui)
  {
    myHeight = (int)(Math.random()*200+200);
    myWidth = (int)(Math.random()*100+100);

    myX = bui.getX()+bui.getWidth();
    myY = height - myHeight;
  }

  public void show()
  {
    fill(255,100,70);
    rect(myX, myY, myWidth, myHeight);
  }

  public void move()
  {
    myX -= 3;
  }

  public void changeX(Building bui)
  {
    myX = bui.getX()+bui.getWidth();
  }

  public boolean isOffScreen()
  {
    if((myX+myWidth)<=0){return true;}
    return false;
  }
}















