class EnemyBullets extends GameObject {

  color bulletcolor;

  EnemyBullets(PVector a, float x, float y, color c, int s) {
    size = s;
    hp = 1;
    location = new PVector(x, y);
    velocity = a;
    bulletcolor = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    stroke(white);
    fill(bulletcolor);
    ellipse(location.x, location.y, size, size);
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
