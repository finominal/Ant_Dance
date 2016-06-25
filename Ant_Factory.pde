

int numberOfAnts = 10;


class Ant  //defines dna of one ant (where it is born, how fast it can move, what it looks like, how it behaves)
{
    float posX, posY;
    float stepSize = 10;
    float diameter = 10;
    
    void startPosition()    // creating a method because assignments can't be run outside method
    {
      posX = mouseX;
      posY = mouseY;
    }
    
    void drawAnt ()
    {
      fill(0, 40);
      ellipse(posX+stepSize/2, posY+stepSize/2, diameter, diameter);
    }
}


Ant[] antArray = new Ant[numberOfAnts]; //array container - vertical (1D) stack of empty ant positions (ie 0-9 for 10 ants) waiting to be filled with all the ants (square brackets means array)


void initialiseAnts ()     // creates new ants and sticks them into their array position 
{
     for (int i=0; i<numberOfAnts; i++) // For(initiliaser; test; action)
     {
        antArray[i] = new Ant();  
        antArray[i].startPosition();
     }
}