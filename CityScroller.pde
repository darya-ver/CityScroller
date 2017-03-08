Building b1; 

ArrayList <Building> buildings = new ArrayList <Building>();

public void setup()
{
  size(500,500);
  b1 = new Building(width);

  buildings.add(new Building(width));
  buildings.add(1, new Building(buildings.get(0)));

}

public void draw()
{
  background(0);
  for(Building b : buildings)
  {
    b.move();
    b.show();
  }
  //b1.move();
  //b1.show();
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

  Building(Building building)
  {
    myHeight = (int)(Math.random()*200+200);
    myWidth = (int)(Math.random()*100+100);

    myX = building.getX()+building.getWidth();
    myY = height - myHeight;
  }

  public int getX(){return myX;}
  public int getY(){return myY;}
  public int getWidth(){return myWidth;}
  public int getHeight(){return myHeight;}

  public void show()
  {
    fill(255,100,70);
    rect(myX, myY, myWidth, myHeight);
  }

  public void move()
  {
    myX -= 3;
  }
}















