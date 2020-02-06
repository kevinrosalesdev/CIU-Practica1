class Platform {
  int jx, jy, pwidth, pheight;

  Platform(float x, int pwidth, int pheight) {
    this.jx=(int)(width*x);
    this.jy=height/2;
    this.pwidth=pwidth;
    this.pheight=pheight;
  }

  void draw() {
    rect(jx, mouseY, pwidth, pheight);
    jy=mouseY;
  }
}
