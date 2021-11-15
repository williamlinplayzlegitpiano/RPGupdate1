void titlescreen() {
  background(0);
  //TITLE TEXT
  textAlign(CENTER, CENTER);
  fill(sprinkle);
  textFont(Candy1);
  textSize(100);
  text("Candy Thief", 400, 155);

  introGIF.show();
  
  startButton.show();

  if (startButton.clicked) {
    presetting();
  }
}
