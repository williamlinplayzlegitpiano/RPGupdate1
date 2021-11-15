class Weapons {

  int shotTimer;
  int threshold;
  int bulletspeed;

  Weapons() {
    shotTimer = 0;
    threshold = 30;
    bulletspeed = 5;
  }

  Weapons(int thr, int bs) {
    shotTimer = 0;
    threshold = thr;
    bulletspeed = bs;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
      aimVector.setMag(bulletspeed);
      myObjects.add(new Bullet(aimVector, strawberry, 10));
      shotTimer = 0;
    }
  }
}
