class Shooter extends Enemy {

  int stimer;
  int bulletspeed;

  Shooter(int x, int y) {
    super(100, 50, x, y);
    stimer = 0;
    hp = 200;
    bulletspeed = 10;
  }

  void show() {
    fill(blue);
    stroke(blue);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textSize(20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();
    stimer++;
    if (stimer == 120) {
      PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      aimVector.setMag(bulletspeed);
      myObjects.add(new EnemyBullets(aimVector, location.x, location.y, pink, 10));
      stimer = 0;
    }
  }
}
