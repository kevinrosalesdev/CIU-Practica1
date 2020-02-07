class Platform {
  int jx, jy, pwidth, pheight;
  boolean isUpPressed, isDownPressed;

  Platform(float x, int pwidth, int pheight) {
    this.jx=(int)(width*x);
    this.jy=height/2;
    this.pwidth=pwidth;
    this.pheight=pheight;
    this.isUpPressed = false;
    this.isDownPressed = false;
  }

  void updateDraw() {
    rect(jx, jy, pwidth, pheight);
  }
}
