class Controller {

  Ball ball;
  Platform p1, p2;
  int pointsP1, pointsP2;
  float scoreLocationP1, scoreLocationP2;

  Controller(Ball ball, Platform p1, Platform p2, float scoreLocationP1, float scoreLocationP2) {
    this.ball = ball;
    this.p1 = p1;
    this.p2 = p2;
    this.scoreLocationP1 = scoreLocationP1;
    this.scoreLocationP2 = scoreLocationP2;
    this.pointsP1 = 0;
    this.pointsP2 = 0;
  }
  
  void updateScore(){
    text(pointsP1, scoreLocationP1*width, 75);
    text(pointsP2, scoreLocationP2*width, 75);
  }
  
  void setBall(Ball ball){
    this.ball=ball;
  }

  boolean updateBall() {
    ball.px=ball.px+ball.vx;
    ball.py=ball.py+ball.vy;
    return bounceBall();
  }

  boolean bounceBall() {
    if (ball.px > width) {
      println("Player 2 lost!");
      pointsP1++;
      return false;
    }
    if (ball.px < 0) {
      println("Player 1 lost!");
      pointsP2++;
      return false;
    }
    if (ball.py > height || ball.py < 0) {
      ball.vy=-ball.vy;
    }
    
    int crashedSide = getCrashedSide();
    if (crashedSide == 1) ball.vy = 0.09*(ball.py-p1.jy)-3.0000;
    if (crashedSide == 2) ball.vy = 0.09*(ball.py-p2.jy)-3.0000;
    if (crashedSide != 0) {
      if (abs(ball.vx) <= 8) ball.vx = -ball.vx*ball.dx;
      else ball.vx = -ball.vx;
    }
    
    return true;
  }

  int getCrashedSide() {
    if (ball.px >= p1.jx && ball.px <= p1.jx+p1.pwidth && ball.py >= p1.jy && ball.py <= p1.jy+p1.pheight) return 1;
    if (ball.px >= p2.jx && ball.px <= p2.jx+p2.pwidth && ball.py >= p2.jy && ball.py <= p2.jy+p2.pheight) return 2;
    return 0;
  }
}
