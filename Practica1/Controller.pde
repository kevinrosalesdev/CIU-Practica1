class Controller {

  Ball ball;
  Platform p1, p2;

  Controller(Ball ball, Platform p1, Platform p2) {
    this.ball = ball;
    this.p1 = p1;
    this.p2 = p2;
  }

  boolean updateBall() {
    ball.px=ball.px+ball.vx;
    ball.py=ball.py+ball.vy;
    return bounceBall();
  }

  boolean bounceBall() {
    if (ball.px > width) {
      println("Player 2 lost!");
      return false;
    }
    if (ball.px < 0) {
      println("Player 1 lost!");
      return false;
    }
    if (ball.py > height || ball.py < 0) {
      ball.vy=-ball.vy;
    }
    if ((ball.px >= p1.jx && ball.px <= p1.jx+10 && ball.py >= p1.jy && ball.py <= p1.jy+70) ||
      (ball.px >= p2.jx && ball.px <= p2.jx+10 && ball.py >= p2.jy && ball.py <= p2.jy+70 )) {
      if (abs(ball.vx) <= 8) ball.vx = -ball.vx*ball.dx;
      else ball.vx = -ball.vx;
      
      if (ball.vy > 0) ball.vy = -random(4);
      else ball.vy = random(4);
    }
    return true;
  }
}
