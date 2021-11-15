class Enemy extends GameObject {

  Enemy() {
    location = new PVector (width/2 + 150, height/2 + 150);
    velocity = new PVector (0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
  }

  Enemy(int ehp, int s, int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = ehp;
    size = s;
    roomX = x;
    roomY = y;
  }


  void show() {

    fill(chocolate);
    stroke(black);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textSize(20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (d <= size/2 + obj.size/2) {
          if (gun == 1) {
            hp = hp - int(obj.velocity.mag()*2);
            obj.hp = 0;
          } else {
            hp = hp - int(obj.velocity.mag());
            obj.hp = 0;
          }
        }
      }
      
      if (obj instanceof Hero) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (d <= size/2 + obj.size/2) {
            hp = hp - int(obj.velocity.mag());
            obj.hp = 0;
        }
      }
      i++;
    }
  }
}
