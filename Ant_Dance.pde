

int NORTH = 0;
int NORTHEAST = 1; 
int EAST = 2;
int SOUTHEAST = 3;
int SOUTH = 4;
int SOUTHWEST = 5;
int WEST = 6;
int NORTHWEST= 7;

int timeHandPresent;
int timeForBed = 10000;

enum GameState {antsHiding, antsPlaying}  //enumerator = named states
GameState CURRENTSTATE = GameState.antsHiding; 

void setup() {
  size(400,900);
  background(255);
  noStroke();
  frameRate(30);
  
  initialiseAnts();  // inialise Ant Array, see method in Ant_Factory tab
}



void draw() {
  background (255);
  
  if (CURRENTSTATE == GameState.antsHiding)  // action when hiding
  {
    actionAntHiding();
  }
  else  // action when playing
  {
    actionAntPlaying();
  }
}


boolean handPresent()
{
  return mousePressed;
}


void actionAntHiding()
{
    if (handPresent())
    {
      CURRENTSTATE = GameState.antsPlaying;
      for (int i=0; i<antArray.length; i++)
      {
        antArray[i].setPositionToMouse();
      }
    }
}


void actionAntPlaying()
{
    if (handPresent())
    {
      timeHandPresent = millis();  // time hand was last preent
      println(timeHandPresent);
      moveAntsToHand(); // for each ant, attract to hand
    }
    else
    {
      if (timeHandPresent + timeForBed < millis())
      {
        CURRENTSTATE = GameState.antsHiding;
      }
      else
      {
        moveAntsRandomly();
      }
    }
}


void moveAntsToHand()  // moves individual ants towards hand
{
  for (int i=0; i<antArray.length; i++)
  {
    moveAntToHand(antArray[i]);
  }
}

void moveAntToHand(Ant handAnt)
{

}

void moveAntsRandomly()  // moves individual ants randomly
{
  for (int i=0; i<antArray.length; i++)
  {
    moveAntRandomly(antArray[i]);
  }
}

void moveAntRandomly(Ant randomAnt)
{
    int direction = (int) random(0, 8);

    if (direction == NORTH) {  
      randomAnt.posY -= randomAnt.stepSize;  
    } 
    else if (direction == NORTHEAST) {
      randomAnt.posX += randomAnt.stepSize;
      randomAnt.posY -= randomAnt.stepSize;
    } 
    else if (direction == EAST) {
      randomAnt.posX += randomAnt.stepSize;
    } 
    else if (direction == SOUTHEAST) {
      randomAnt.posX += randomAnt.stepSize;
      randomAnt.posY += randomAnt.stepSize;
    }
    else if (direction == SOUTH) {
      randomAnt.posY += randomAnt.stepSize;
    }
    else if (direction == SOUTHWEST) {
      randomAnt.posX -= randomAnt.stepSize;
      randomAnt.posY += randomAnt.stepSize;
    }
    else if (direction == WEST) {
      randomAnt.posX -= randomAnt.stepSize;
    }
    else if (direction == NORTHWEST) {
      randomAnt.posX -= randomAnt.stepSize;
      randomAnt.posY -= randomAnt.stepSize;
    }

    if (randomAnt.posX > width) randomAnt.posX = 0;
    if (randomAnt.posX < 0) randomAnt.posX = width;
    if (randomAnt.posY < 0) randomAnt.posY = height;
    if (randomAnt.posY > height) randomAnt.posY = 0;
    
    randomAnt.drawAnt();
}