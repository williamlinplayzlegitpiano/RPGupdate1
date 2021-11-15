class Shotgun extends Weapons {

  Shotgun() {
    super(100, 5);
  }

  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 15; i++) {
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(-0.3, 0.3));
        aimVector.setMag(bulletspeed);
        myObjects.add(new Bullet(aimVector, strawberry, 10));
      }
      shotTimer = 0;
    }
  }
}
