class Hero extends GameObject {

  float speed;
  Weapons myWeapon;

  Hero() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 3;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40;
    myWeapon = new SniperRifle();
    immunity = 0;
  }

  void show() {
    fill(chocolate);
    if (immunity <= 180) {
      stroke(white);
    } else {
      stroke(strawberry);
    }
    strokeWeight(2);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();

    immunity++;
    if (immunity >= 180) {
      int i = 0;
      while (i<myObjects.size()) {
        GameObject obj = myObjects.get(i);
        if (obj instanceof Enemy) {
          float d = dist(obj.location.x, obj.location.y, location.x, location.y);
          if (d <= size/2 + obj.size/2) {
            hp--;
            immunity = 0;
            println(666);
          }
        }
        i++;
      }
    }

    if (w) velocity.y = -speed;
    if (s) velocity.y = speed;
    if (a) velocity.x = -speed;
    if (d) velocity.x = speed;

    if (velocity.mag() > speed) velocity.setMag(speed);

    if (!w && !s) velocity.y = velocity.y * 0.8;
    if (!a && !d) velocity.x = velocity.x * 0.8;

    if (northRoom != #FFFFFF && location.y == height*0.1 && location.x >= width/2-50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector (width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && location.x == width*0.9 && location.y >= height/2 -50 && location.y <=height/2 +50) {
      roomX++;
      location = new PVector (width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF && location.y == height*0.9 && location.x >= width/2-50 && location.x <= width/2 +50) {
      roomY++;
      location = new PVector (width/2, height*0.1+10);
    }

    if (westRoom != #FFFFFF && location.x == width*0.1 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector (width*0.9-10, height/2);
    }
    myWeapon.update();
    if (space) myWeapon.shoot();
  }
}
