module rounder2D(r=1) {
  minkowski() {
    circle(r=r);
    offset(delta=-r) children(0);
  }
}

module rsquare(p, r=.8, center=false) {
  rounder2D(r=r) square(p, center);
}

