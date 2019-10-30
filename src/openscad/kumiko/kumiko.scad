$l = 100;
$s = 5;
$h = 8;
$fn=30;
$extrude = true;
$colorit = true;
$vslack = .05;

function measure(x) = sqrt(x*x);

module kolor(c) {
  if ($colorit) {
    color(c) children();
  } else {
    children();
  }
}

module maybe_extrude() {
  if ($extrude) {
    linear_extrude($h, center=true) {
      children();
    }
  } else {
    children();
  }
}

// Debugging, put a little dot at p
module _pp(p) {
  echo(p);
  translate(p)
    color("black")circle(r=1);
}

// Debugging, put a little dot at p
module _ppp(p) {
  echo(p);
  translate([p[0], p[1], $h / 2])
    color("black")sphere(r=1);
}

module framer(a=90, n=1) {
  translate([(1 - n) * $l / 2, 0, 0]) {
    for (i = [0 : n - 1]) {
      translate([i * $l, 0, 0]) {
        difference() {
          cube([$l + 5 * $s, $s, $h], center=true);
          translate([-$l / 2, 0, $h / 2 - $vslack]) {
            rotate(a) {
              cube([$s * 3, $s, $h + 2 * $vslack ], center=true);
            }
          }
          translate([$l / 2, 0, $h / 2 - $vslack]) {
            rotate(-a) {
              cube([$s * 3, $s, $h + 2 * $vslack ], center=true);
            }
          }
        }
      }
    }
  }
}

module frame2() {
  translate([-$l / 2, 0, 0]) {
    framer();
  }
  translate([$l / 2, 0, 0]) {
    framer();
  }
}

module frame4(nx, ny) {
  for (j = [-ny /2 : 1 : ny / 2]) {
    translate([0, j * $l, 0]) {
      kolor([.8, .8, .8]) {
        framer(n=nx);
      }
    }
  }
  for (i = [-nx / 2 : 1 : nx / 2]) {
    translate([i * $l, 0, 0]) {
      rotate(90) {
        scale([1, 1, -1]) {
          kolor([.9, .9, .9]) {
            framer(n=ny);
          }
        }
      }
    }
  }
}

module frame6(n=6) {
  for (t = [0 : n - 1]) {
    rotate(t * 60) {
      translate([0, $l * sqrt(3)/2, 0]) {
        scale([1, 1, 1 - (t % 2) * 2]) {
          framer(a=60);
        }
      }
    }
  }
}

// Where does the line passing through (x1, y1) with slope tan(a1)
// intersect the line passing through (x2, y2) with slope tan(a2)?
//
// The equation of a  line through x0, y0 with slope λ0 = tan(a0) is
//
// (Y - y0) / (X - x0) = λ0  ................................... [1]
//
// equivalently:
//
// Y = λ0 * (X - x0) + y0    ................................... [2]
//
//
// equivalently
//
// X = x0 + (Y - y0) / λ0    ................................... [3]


// The two lines intersect at:
//
// λ1 * (X - x1) + y1 = λ2 * (X - x2) + y2
//
// => λ1 * X - λ1 * x1 + y1 = λ2 * X - λ2 * x2 + y2
//
// => λ1 * X - λ2 * X = λ1 * x1 - y1 - λ2 * x2 + y2
//
// => (λ1 - λ2) * X = (λ1 * x1  - λ2 * x2) - (y1 - y2)
//
//
// X = ((λ1 * x1  - λ2 * x2) - (y1 - y2)) / (λ1 - λ2) .........  [4]
//
//
// Prettier:
//
//          (λ1 * x1  - λ2 * x2) - (y1 - y2)
//    X = ------------------------------------
//                      (λ1 - λ2)
//
//
// We can derive Y two ways:
//
// Substituting X from [4] into [2] for either line,
// or more elegantly by using [3]:
//
// x1 + (Y - y1) / λ1 = x2 + (Y - y2) / λ2
//
// => λ1 * λ2 * x1 + λ2 * Y - λ2 * y1 = λ2 * λ1 * x2 + λ1 * Y - λ1 * y2
//
// =>  λ1 * Y -  λ2 * Y = λ1 * λ2 * x1 -  λ1 * λ2 * x2 + λ2 * y1  - λ1 * y2
//
// => Y = (λ1 * λ2 * (x1 - x2) + λ1 * y2  - λ2 * y1) / (λ1 - λ2) .. [5]
//
//
// Prettier
//
//          λ1 * λ2 * (x1 - x2) + λ1 * y2  - λ2 * y1
//    Y = --------------------------------------------
//                       (λ1 - λ2)
//
//
//
// If line1 is vertical, intersection is at [x1, y2 - (x2 - x1) * λ2]
// If line2 is vertical, intersection is at [x2, y1 - (x1 - x2) * λ1]

function intersect_lines(x1, y1, a1, x2, y2, a2) =
  (abs(a1) == 90) ? [x1, y2 - (x2 - x1) * tan(a2)] :  // line1 is vertical
  (abs(a2) == 90) ? [x2, y1 - (x1 - x2) * tan(a1)] :  // line2 is vertical
                    [
                     ((tan(a1) * x1  - tan(a2) * x2) - (y1 - y2)) / (tan(a1) - tan(a2)),
                     (tan(a1) * tan(a2) * (x1 - x2) + tan(a1) * y2 - tan(a2) * y1) / (tan(a1) - tan(a2))
                     ];


// Our "lines" have thickness, so we need to intersect where the shifted
// lines meet
function intersect_lines_offset(x1, y1, a1, x2, y2, a2, o1, o2) =
  intersect_lines(x1 - cos(a1 + 90) * o1 / 2,
                  y1 - sin(a1 + 90) * o1 / 2,
                  a1,
                  x2 - cos(a2 + 90) * o2 / 2,
                  y2 - sin(a2 + 90) * o2 / 2,
                  a2);

function flip(x) = [x[1], x[0]];

//
//
//
//      Y                            xxxxxx
//      Y                             P
//      Y                           P  q
//      Y                         P   q
//      Y                       P    q
//      Y                     P     q
//      Y                   P      q
//      Y                 P       q
//      Y               P        q
//      Y             P         q
//      Y           P          Q
//      Y         P        Q    R
//      Y       P      Q          R
//      Y     P    Q                R   y
//      Y   P  Q                     R  y
//      Y PQ                           Ry
//       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//
//
// X: (0, 0), 0°
// Y: (0, 0), 90°
// x: (l, l), 0°
// y: (l, 0), 90°
// P: (0, 0), 45°
// Q: (0, 0), 22.5°
// q: (l, l), -135° + 22.5°
// R: (l, 0), 135°


module quad(which="nothing") {
  LLx = 0;
  LLy = 0;
  LL  = [LLx, LLy];
  LL3 = [LLx, LLy, 0];
  LRx = $l;
  LRy = 0;
  LR  = [LRx, LRy];
  LR3 = [LRx, LRy, 0];
  ULx = 0;
  ULy = $l;
  UL = [ULx, ULy];
  UL3= [ULx, ULy, 0];
  URx = $l;
  URy = $l;
  UR  = [URx, URy];
  UR3 = [URx, URy, 0];

// Use symmetry where possible

  p0 = [$s / 2, $s / 2];
  p1 = intersect_lines_offset(LLx, LLy, 45, LLx, LLy, 22.5, $s, -$s);
  p2 = UR - flip(p1);
  p3 = UR - p0;
  p4 = flip(p2);
  p5 = flip(p1);

  module p() {
    maybe_extrude() {
      polygon(points=[p0, p1, p2, p3, p4, p5]);
    }
  }

  q0 = p0;
  q1 = intersect_lines_offset(LLx, LLy, 22.5, LLx, LLy, 0, $s, -$s);
  q2 = intersect_lines_offset(LLx, LLy, 22.5, LRx, LRy, 135, $s, -$s);
  q3 = intersect_lines_offset(LLx, LLy, 22.5, URx, URy, -135 + 22.5, 0, 0);
  q4 = intersect_lines_offset(LLx, LLy, 22.5, URx, URy, -135 + 22.5, -$s, $s);
  q5 = p1;

  module q() {
    maybe_extrude() {
      polygon(points=[q0, q1, q2, q3, q4, q5]);
    }
  }

  r0 = LR - [$s / 2, -$s / 2];
  r1 = intersect_lines_offset(LRx, LRy, 0, LRx, LRy, 135, -$s, -$s);
  r2 = q2;
  r3 = q3;
  r4 = UR - flip(r2);
  r5 = UR - flip(r1);

  module r() {
    maybe_extrude() {
      polygon(points=[r0, r1, r2, r3, r4, r5]);
    }
  }

  if (which == "p") {
    p();
  } else if (which == "q") {
    q();
  } else if (which == "r") {
    r();
  } else if (which == "qm") {
    mirror([1, -1]) q();
  } else {
    kolor("red") p();

    kolor("green") q();
    kolor("olive") translate(UR3) mirror([1, 1]) q();
    kolor("lime") translate(LL3) mirror([1, -1]) q();
    kolor("lightgreen") mirror([1, -1]) translate(UR3) mirror([1, 1]) q();

    kolor("blue") r();
    kolor("cyan") mirror([1, -1]) r();
  }
}

// Print 6 of this:

*framer(n=2);

// Print 4 of this:
*quad("p");

// Print 8 of each of these
*quad("q");
*quad("qm");
*quad("r");

// show
*union() {
  x = 2;
  y = 2;

  frame4(2 * x, 2 * y);
  for (i = [-x + 1 : 2 : x], j = [-y + 1 : 2 : y]) {
    translate([$l * i, $l * j]) {
      for (a = [0 : 90 : 359]) {
        rotate(a) {
          quad();
        }
      }
    }
  }
}

module hex(which="nothing") {
  LLx = 0;
  LLy = 0;
  LL  = [LLx, LLy];
  LL3 = [LLx, LLy, 0];

  LRx = $l;
  LRy = 0;
  LR  = [LRx, LRy];
  LR3 = [LRx, LRy, 0];

  UUx = $l / 2;
  UUy = $l * sqrt(3) / 2;
  UU  = [UUx, UUy];
  UU3 = [UUx, UUy, 0];

  p0 = intersect_lines_offset(LLx, LLy, 0, LLx, LLy, 60, 0, 0);
  p1 = intersect_lines_offset(LLx, LLy, 0, LLx, LLy, 60, -$s, $s);
  p2 = intersect_lines_offset(LLx, LLy, 0, LRx, LRy, 120, -$s, -$s);
  p3 = intersect_lines_offset(LRx, LRy, 120, LRx, LRy, -120, -$s, $s);
  p4 = [p2[0], -p2[1]];
  p5 = [p1[0], -p1[1]];

  module p() {
    maybe_extrude() {
      polygon(points=[p0, p1, p2, p3, p4, p5]);
    }
  }

  q0 = p1;
  q1 = intersect_lines_offset(LLx, LLy, 0, LLx, LLy, 30, -$s, $s);
  q2 = intersect_lines_offset(LLx, LLy, 30, LRx, LRy, 150, $s, -$s);
  q3 = intersect_lines_offset(LLx, LLy, 30, LRx, LRy, 150, 0, 0);
  q4 = intersect_lines_offset(LLx, LLy, 30, UUx, UUy, 90, -$s, -$s);
  q5 = intersect_lines_offset(LLx, LLy, 30, LLx, LLy, 60, -$s, $s);

  module q() {
    maybe_extrude() {
      polygon(points=[q0, q1, q2, q3, q4, q5]);
    }
  }

  r0 = q3;
  r1 = q2;
  r2 = intersect_lines_offset(LRx, LRy, 0, LRx, LRy, 150, -$s, -$s);
  r3 = p2;
  r4 = intersect_lines_offset(LRx, LRy, 120, LRx, LRy, 150, -$s, $s);
  r5 = [$l - q4[0], q4[1]];
  module r() {
    maybe_extrude() {
      polygon(points=[r0, r1, r2, r3, r4, r5]);
    }
  }

  f = LRx / 3;
  x0 = intersect_lines_offset(LLx, LLy, 0, f, LLy, 30, -$s, -$s);
  x1 = intersect_lines_offset(LLx, LLy, 0, f, LLy, 30, -$s, $s);
  x2 = intersect_lines_offset(LRx / 3, LLy, 30, LRx, LRy, 150, $s, -$s);
  x3 = intersect_lines_offset(LRx / 3, LLy, 30, LRx, LRy, 150, -$s, -$s);

  module xd() {
    if ($extrude) {
      difference() {
        linear_extrude($h, center=true) {
          polygon(points=[x0, x1, x2, x3]);
        }
        translate(LR3 - [0, 0, $vslack]) {
          linear_extrude($h / 2 + 2*$vslack) {
            scale([-1, 1]) polygon(points=[x0, x1, x2, x3]);
          }
        }
      }
    } else {
      polygon(points=[x0, x1, x2, x3]);
    }
  }

  module xs() {
    if ($extrude) {
      translate(LR3) {
        scale([-1, 1, -1]) {
          xd();
        }
      }
    } else {
      translate(LR) {
        scale([-1, 1]) {
          xd();
        }
      }
    }
  }

  module rota() {
    translate(LR) rotate(120) children();
  }

  module rotb() {
    translate(UU) rotate(240) children();
  }

  if (which == "p") {
    p();
  } else if (which == "q") {
    q();
  } else if (which == "r") {
    r();
  } else if (which == "xd") {
    xd();
  } else if (which == "xs") {
    xs();
  } else {
    kolor("red") p();

    kolor("teal") q();

    kolor("cyan") r();
    kolor("turquoise") rota() r();

    kolor("green") xd();
    kolor("lime") rota() xd();
    kolor("olive") rotb() xd();
    xs();
    rota() xs();
    rotb() xs();
  }

  //_ppp(r5);
}

// Print 6 of this:
*framer(a=60);

// Print 6 of this:
*hex(which="p");

// Print 6 of this:
*rotate(-30) hex(which="q");

// print 12 of this;
*rotate(30) hex(which="r");

// print 18 of this:
*rotate(-30)hex(which="xd");

// print 18 of this:
*rotate([180, 0, -30])hex(which="xs");

// all at once

// all at once: frame/p/q
%translate([0, 0, -10]) cube([210, 210, 1]);
union() {
  ysep = $s + 6;
  // 6 x framers
  for (i = [1 : 6]) {
    translate([$l / 2 + 3 * $s, i * ysep, 0])
      framer(a=60);
  }

  // 6 x p
  for (i = [1 : 6]) {
    translate([2, (i + 6) * ysep, 0])
        hex("p");
  }

  // 6 x q
  for (i = [1 : 6]) {
    translate([140, i * ysep, 0])
      rotate(-30)
      hex("q");
  }

  for (i = [1 : 6]) {
    translate([75, (i + 1.5) * ysep, 0])
        rotate(30)
          hex("r");
  }
  for (i = [7 : 12]) {
    translate([130, (i - 4.5) * ysep, 0])
        rotate(30)
          hex("r");
  }
  for (i = [1 : 6]) {
    translate([-8, (i + 14) * ysep, 0]) {
      translate([10, -ysep / 2, 0])
        rotate(-30)
          hex("xd");
      translate([-12, ysep, 0])
        rotate([180, 0, -30])
          hex("xs");
    }
  }
  for (i = [7 : 12]) {
    translate([60, (i + 8) * ysep, 0]) {
      translate([10, -ysep / 2, 0])
        rotate(-30)
          hex("xd");
      translate([-12, ysep, 0])
        rotate([180, 0, -30])
          hex("xs");
    }
  }
  for (i = [13 : 18]) {
    translate([130, (i + 2) * ysep, 0]) {
      translate([10, -ysep / 2, 0])
        rotate(-30)
          hex("xd");
      translate([-12, ysep, 0])
        rotate([180, 0, -30])
          hex("xs");
    }
  }
}

// show one
*hex();

// show all
*union() {
  rotate(-120)
  frame6(n=3);
  hex();

}

*union() {
  color("silver") frame6();
  for (i = [0:60:359]) {
    rotate(i) {
      hex();
    }
  }
}
