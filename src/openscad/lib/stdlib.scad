module put_corners_2D(ol_x, ol_y, ol_r) {
  for (i = [-1, 1], j = [-1, 1]) {
    scale([i, j]) {
      translate([ol_x / 2 - ol_r, ol_y / 2 - ol_r]) {
        children();
      }
    }
  }
}

module put_corners_3D(ol_x, ol_y, ol_r) {
  for (i = [-1, 1], j = [-1, 1]) {
    scale([i, j, 1]) {
      translate([ol_x / 2 - ol_r, ol_y / 2 - ol_r, 0]) {
        children();
      }
    }
  }
}

module ccube(v) {
     translate([-v[0]/2, -v[1]/2, 0]) cube(v);
}


// rounded, centered square
module rcsquare(x, y, r) {
  hull() {
    put_corners_2D(x, y, r) {
      circle(r=r);
    }
  }
}

module rccube(x, y, z, rxy, zcenter=false) {
  linear_extrude(z, center=zcenter) {
    rcsquare(x, y, rxy);
  }
}

module kolor(c) {
  if ($kolorit) {
    color(c) children();
  } else {
    children();
  }
}

function measure(v) = sqrt(v*v);

module punch(radius, thickness, hymen=-1) {
  // Instead of using cylinder() to punch a hole,
  // use punch() and then fill it in with a
  // rounded outline and a hymen that can be pierced.

  if (hymen < 0) {
    cylinder(r=radius + thickness / 2, h=thickness, center=true);
  } else {
    rotate_extrude() {
      /* translate([radius + thickness / 2, 0]) { */
      /*   circle(r=thickness / 2); */
      /* } */
      polygon(points=[[radius, 0],
                      [radius + thickness / 2, thickness / 2],
                      [radius + thickness / 2, -thickness / 2]
                      ]);

    }
    cylinder(r=radius + thickness / 2, h=hymen, center=true);
  }
}

*difference() {
  union() {
    difference() {
      ccube([50, 50, 10]);
      translate([0, 0, 5]) {
        punch(20, 10);
      }
    }
    translate([0, 0, 5]) {
      punch(20, 10, .4);
    }
  }
  cube([30, 30, 30]);
}
