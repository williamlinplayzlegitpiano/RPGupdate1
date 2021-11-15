class Bullet extends GameObject {

  color col;

  Bullet(PVector a, color c, int s) {
    hp = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = a;
    velocity.add(myHero.velocity);
    col = c;
    size = s;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    fill(chocolate);
    circle(location.x, location.y, size);
  }

  void act() {
    location.add(velocity);
    if (location.x > width*0.9 || location.x < width*0.1 || location.y > height*0.9 || location.y < height*0.1) {
      hp = 0;
      int i = 0;
      while (i < 30) {
        myObjects.add(new bparticles(5, location.x, location.y, chocolate));
        i++;
      }
    }
  }
}
