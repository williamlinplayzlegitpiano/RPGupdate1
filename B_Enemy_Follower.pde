class Follower extends Enemy {

  Follower(int x, int y) {
    super(100, 50, x, y);
  }

  void show() {
    fill(sprinkle);
    stroke(sprinkle);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textSize(20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();

    if (myHero.location.x - location.x <= 50 && myHero.location.y - location.y <= 200) {
      velocity = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
      velocity.setMag(2);
    } else {
      velocity = new PVector (0, 1);
      velocity.rotate(random(0, TWO_PI));
      velocity.setMag(4);
    }
  }
}
