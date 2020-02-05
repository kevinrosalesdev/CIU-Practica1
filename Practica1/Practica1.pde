import processing.sound.*;

Ball ball;
Platform p1, p2;
Controller controller;

Sound sound;

void setup() {
  //sound = new SoundFile("...");
  surface.setTitle("Pong");
  size(500, 500);
  fill(128);
  noStroke();
  p1 = new Platform(0.1);
  p2 = new Platform(0.9);
  ball = new Ball(1.05);
  controller = new Controller(ball, p1, p2);
}

void draw() {
  background(0);
  rect(width/2, 0, 1, height);
  ball.draw();
  p1.draw();
  p2.draw();
  if (!controller.updateBall()) setup();
}
