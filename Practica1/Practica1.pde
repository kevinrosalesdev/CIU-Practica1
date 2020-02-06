import processing.sound.*;

Ball ball;
Platform p1, p2;
Controller controller;

Sound sound;

void setup() {
  //sound = new SoundFile("...");
  surface.setTitle("Pong");
  size(750, 500);
  fill(128);
  noStroke();
  textSize(70);
  p1 = new Platform(0.1, 10, 70);
  p2 = new Platform(0.9, 10, 70);
  ball = new Ball(1.05, 20, 20);
  controller = new Controller(ball, p1, p2, 0.4, 0.55);
}

void draw() {
  background(0);
  rect(width/2, 0, 1, height);
  ball.draw();
  p1.draw();
  p2.draw();
  controller.updateScore();
  if (!controller.updateBall()){
    ball = new Ball(1.05, 20, 20);
    controller.setBall(ball);
  }
}
