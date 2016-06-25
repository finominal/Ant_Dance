

class Attractor {
  // position
  float x, y; 

  // radius of impact
  float radius;

  Attractor(float startingX, float startingY, float startingRadius) {
    x = startingX;
    y = startingY;
    radius = startingRadius;
  }

  void attract(Ant eachAnt) {
    
      calculateMovementForce( eachAnt,1);
      randomiseMovements(eachAnt);

    }
    
      void nest(Ant eachAnt) {
    
      calculateMovementForce( eachAnt,2);
       randomiseMovements(eachAnt);

    }
    
    void randomiseMovements(Ant ant)
    {
          // adds random force to current veloicty towards hand to avoid straight line (simulate jerky ant behaviour)
      ant.velocity.x += random(-movementVariable,movementVariable);
      ant.velocity.y += random(-movementVariable,movementVariable);
    }
    
    void calculateMovementForce(Ant ant, float speed)
    {
        // calculate distance
    float dx = x - ant.x;
    float dy = y - ant.y;
    float d = mag(dx, dy);

    if (d > 0 && d < radius) {
      // calculate force
      float s = d/radius;
      float f = 1 / pow(s, 0.5) - 1;
      f = f / radius;
      
      // apply force to veloicty towards hand
      ant.velocity.x = dx * f * (movementVariable*4)*speed;
      ant.velocity.y = dy * f * (movementVariable*3)*speed;
    }
  }
}