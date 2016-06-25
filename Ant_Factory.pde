

int numberOfAnts = 10000;


class Ant extends PVector //defines dna of one ant (where it is born, how fast it can move, what it looks like, how it behaves)
{
    PVector velocity = new PVector();
    float minX=10, minY=10, maxX=width-10, maxY=height-10;
    //float stepSize = 10;
    float diameter = 10;
    //float damping = 0.1;
    
    
    
    void drawAnt()
    {
      fill(0, 40);
      ellipse(x, y, diameter, diameter);
    }
    
    void setPositionToMouse(){
      x = mouseX;
      y = mouseY;
    }
    
      // ------ calculate new position of the node ------
  void update() {
    
    //add velocity to current location
    x += velocity.x;
    y += velocity.y;

//bounce off walls
    if (x < minX) {
      x = minX - (x - minX);
      velocity.x = -velocity.x;
    }
    if (x > maxX) {
      x = maxX - (x - maxX);
      velocity.x = -velocity.x;
    }

    if (y < minY) {
      y = minY - (y - minY);
      velocity.y = -velocity.y;
    }
    if (y > maxY) {
      y = maxY - (y - maxY);
      velocity.y = -velocity.y;
    }

    //velocity.x *= (1-damping);
    //velocity.y *= (1-damping);
  }
  
  boolean IsAtNest(float nestX, float nestY)
  {
    //test is the ant near the attractor?
    if(abs(nestX-x)<4 && abs(nestY-y)<4)
    {
  
      return true;
    }
    else
    {
    
    return false;
  }
  }
    
}


Ant[] antArray = new Ant[numberOfAnts]; //array container - vertical (1D) stack of empty ant positions (ie 0-9 for 10 ants) waiting to be filled with all the ants (square brackets means array)


void initialiseAnts ()     // creates new ants and sticks them into their array position 
{
     for (int i=0; i<numberOfAnts; i++) // For(initiliaser; test; action)
     {
        antArray[i] = new Ant();  
     }
}