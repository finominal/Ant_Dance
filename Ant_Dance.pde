

int NORTH = 0;
int NORTHEAST = 1; 
int EAST = 2;
int SOUTHEAST = 3;
int SOUTH = 4;
int SOUTHWEST = 5;
int WEST = 6;
int NORTHWEST= 7;



void setup() {
  size(400,900);
  background(255);
  noStroke();
  frameRate(8);
  initialiseAnts();  // Ant Array starting location, see method in Ant_Factory tab
}



void draw() {
  background (255);
  
  MoveAnts();    // run move ants method, see below
  
}


void MoveAnts()  // gets ants one at a time out of array and sends to MoveAnt method (for = untill all ants moved then start at the beginning) nerdWords = iterate through antArray and move Ants one step
{
  
   for (int i=0; i<antArray.length; i++) // For(initiliaser; test; action)
   {
     //for each ant in the array
     //check to see if a hand is present
     if(IsAHandPresent())
     {
       //Yes, a hand is present
       MoveAntTowardsHand(antArray[i]);
     }
     else
     {
     //Nope, dont see a hand around here anywhere
     MoveAntRandomly(antArray[i]);
   }
 }
 
 
}

boolean IsAHandPresent()
{
  return mousePressed;
}

void MoveAntTowardsHand(Ant thisAnt)  // moves individual ants towards hand
{
    
    thisAnt.drawAnt();
}


void MoveAntRandomly(Ant thisAnt)  // moves individual ants randomly
{
    int direction = (int) random(0, 8);

    if (direction == NORTH) {  
      thisAnt.posY -= thisAnt.stepSize;  
    } 
    else if (direction == NORTHEAST) {
      thisAnt.posX += thisAnt.stepSize;
      thisAnt.posY -= thisAnt.stepSize;
    } 
    else if (direction == EAST) {
      thisAnt.posX += thisAnt.stepSize;
    } 
    else if (direction == SOUTHEAST) {
      thisAnt.posX += thisAnt.stepSize;
      thisAnt.posY += thisAnt.stepSize;
    }
    else if (direction == SOUTH) {
      thisAnt.posY += thisAnt.stepSize;
    }
    else if (direction == SOUTHWEST) {
      thisAnt.posX -= thisAnt.stepSize;
      thisAnt.posY += thisAnt.stepSize;
    }
    else if (direction == WEST) {
      thisAnt.posX -= thisAnt.stepSize;
    }
    else if (direction == NORTHWEST) {
      thisAnt.posX -= thisAnt.stepSize;
      thisAnt.posY -= thisAnt.stepSize;
    }

    if (thisAnt.posX > width) thisAnt.posX = 0;
    if (thisAnt.posX < 0) thisAnt.posX = width;
    if (thisAnt.posY < 0) thisAnt.posY = height;
    if (thisAnt.posY > height) thisAnt.posY = 0;
    
    thisAnt.drawAnt();
}