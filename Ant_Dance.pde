

// applies to:  
// Ant_Dance = random velocity
// Attractor Factory = force towards hand & randomise direction towards hand
int movementVariable = 10;

// attractor
Attractor handAttractor;
Attractor nestAttractor;

int timeHandPresent;
int timeToNest = 5000;

enum GameState {antsSleeping, antsPlaying, antsNesting} //enumerator = named states
GameState CURRENTSTATE = GameState.antsSleeping; 

void setup() {
  fullScreen();
  background(255);
  noStroke();
  frameRate(10);
  
  // inialise Ant Array, see method in Ant_Factory tab
  initialiseAnts();
  
  // setup hand as attractor, see method in Attractor_Factory tab
  handAttractor = new Attractor(0, 0, 300);
  
  // setup nest as attractor, see method in Attractor_Factory tab
  nestAttractor = new Attractor(width/2, height/2, 1200);
}



void draw() {
  background (255);
  
  if (CURRENTSTATE == GameState.antsSleeping)  // action when Sleeping
  {
    actionAntSleeping();
  }
  if (CURRENTSTATE == GameState.antsNesting)
  {
    actionAntsNesting();
  }
  if (CURRENTSTATE == GameState.antsPlaying) // action when playing
  {
      actionAntsPlaying();
  }
}


boolean handPresent()
{
  return mousePressed;
}


void actionAntSleeping()
{
    if (handPresent())
    {
      CURRENTSTATE = GameState.antsPlaying;
      for (int i=0; i<antArray.length; i++)
      {
        antArray[i].setPositionToMouse();
        timeHandPresent = millis();
      }
    }
}


void actionAntsPlaying() 
{
   if (timeHandPresent + timeToNest < millis())
   {
     CURRENTSTATE = GameState.antsNesting;
   }
   
  handAttractor.x = mouseX;
  handAttractor.y = mouseY;

  for (int i=0; i < antArray.length; i++) {

     //set a random velocity
     antArray[i].velocity.x = random(-movementVariable, movementVariable);
     antArray[i].velocity.y = random(-movementVariable, movementVariable);
   
    if (handPresent()) {
      timeHandPresent = millis();  // time hand was last present
      handAttractor.attract(antArray[i]);    // attract ants
 
    }

    antArray[i].update();   // apply forces 
    antArray[i].drawAnt();   //  draw ant
  }
}


void actionAntsNesting()
{
  
   boolean allAntsHome = true;
   
   //check if ant is home, if not,move it and draw it. 
    for (int i=0; i < antArray.length; i++) 
    {
      
        if(antArray[i].IsAtNest(nestAttractor.x, nestAttractor.y) == false)
        {
          nestAttractor.nest(antArray[i]);    // attract ants 
          antArray[i].update();   // apply forces 
          antArray[i].drawAnt();
          allAntsHome = false;//some ants are not home yet.
        }
    }
    
    if(allAntsHome) //only if all ants are home should we go to sleep!
    {
      CURRENTSTATE = GameState.antsSleeping;
     println("SLEEPING");
    }
}