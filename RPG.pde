import processing.javafx.*;

int gun;

int mode;
final int titlescreen = 1;
final int presetting = 2;
final int game = 3;
final int revive = 4;
final int gameover = 5;

AnimatedGIF introGIF;
//AnimatedButton introButton;

boolean w, a, s, d, space;

color chocolate = #774F38;
color strawberry = #E08E79;
color cake = #F1D4AF;
color vanilla = #ECE5CE;
color sprinkle = #C5E0DC;

int textAngle;
PFont Candy1;
PFont Candy2;
PFont Candy3;

//PImage map;
color northRoom, eastRoom, southRoom, westRoom;

boolean mouseReleased;
boolean wasPressed;

ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;

Button startButton;
//Button blueButton, greenButton, pinkButton, blackButton;
//color bkg;

color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;

PImage map;

int immunity, immunitytimer;

void setup() {

  gun = 1;

  size(800, 600, FX2D);
  mode = 1;

  introGIF = new AnimatedGIF(14, "frame_", "_delay-0.15s.gif");

  Candy1 = createFont("Delight Candles .ttf", 200);
  Candy2 = createFont("Snowy Holiday.ttf", 200);
  Candy3 = createFont("Snowy Night.ttf", 200);

  startButton = new Button("PLAY", 400, 340, 200, 100, sprinkle, chocolate);

  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);
  myObjects.add(new Enemy());
  myObjects.add(new Follower(1, 2));
  myObjects.add(new Follower(2, 1));
  myObjects.add(new Shooter(1, 3));
  myObjects.add(new Shooter(3, 1));


  map = loadImage("map.png");

  darkness = new ArrayList<DarknessCell>(1000);
  float size = 5;
  int x = 0, y = 0;
  while (y <height) {
    darkness.add(new DarknessCell(x, y, size));
    x += size;
    if (x >= width) {
      x = 0;
      y += size;
    }

    gun = 0;
  }
}


void draw() {

  click();

  if (mode == titlescreen) {
    titlescreen();
  } else if (mode == presetting) {
    presetting();
  } else if (mode == game) {
    game();
  } else if (mode == revive) {
    revive();
  } else if (mode == gameover) {
    gameover();
  } else {
    println("ERROR: Mode = " + mode);
  }
}


void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
