// from <MCAD/regular_shapes.scad>
module bj_square_pyramid(base_x, base_y, height) {
  w = base_x / 2;
  h = base_y / 2;
  polyhedron(
      points=[[-w, -h, 0], [-w, h, 0], [w, h, 0], [w, -h, 0], [0, 0, height]],
      faces=[[0, 3, 2, 1], [0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]]);
}


// R² - r² = (R - dip)² ∴
// R - dip = √(R² - r²) ∴
// dip = R - √(R² - r²) ∎
function _dip(R, r) = (R - sqrt(R*R - r*r));


// Ball with a stud, to be used in a ball socket joint.
module bj_ball(
  ball_diameter,
  stud_diameter,
  stud_length,      // Will be adjusted to engulf the ball.
  hole_diameter=0,  // a horizontal hole along the ball's y axis,
                    // so that, e.g., a limiting rod can be inserted.
) {
  ball_radius = ball_diameter / 2;   // R
  stud_radius = stud_diameter / 2;   // r
  dip = _dip(ball_radius, stud_radius);
  union() {
    cylinder(r=stud_radius, h=(stud_length + dip));
    translate([0, 0, stud_length + ball_radius]) {
      difference() {
        sphere(r=ball_radius);
        if (hole_diameter > 0) {
	  rotate(90, [1, 0, 0]) {
            cylinder(h=ball_diameter, r=(hole_diameter / 2), center=true);
          }
        }
      }
    }
  }
}

module bj_socket(
  ball_diameter,
  stud_diameter,
  stud_length,
  socket_thickness=2,
  additional_slot_thickness=0,
  socket_notches=4,
  tolerance=.1,
  mouth_angle=120,
  flat_top=true,
){
  outer_ball_radius = ball_diameter / 2 + socket_thickness + tolerance;
  inner_ball_radius = ball_diameter / 2;
  stud_radius = stud_diameter / 2;
  dip = _dip(outer_ball_radius, stud_radius);
  difference() {
    // ++++++++
    union() {
      cylinder(r=stud_radius, h=(stud_length + dip));
      translate([0, 0, stud_length + outer_ball_radius]) {
        sphere(r=outer_ball_radius);
      }
    }

    // --------
    translate([0, 0, stud_length + outer_ball_radius]) {
      sphere(r=inner_ball_radius);
      delta_z = inner_ball_radius * cos(mouth_angle / 2);
      if (flat_top) {
        translate([-outer_ball_radius, -outer_ball_radius, delta_z]) {
          cube([2 * outer_ball_radius, 2 * outer_ball_radius, outer_ball_radius]);
        }
      } else {
        cylinder(r1=0, r2=(outer_ball_radius * tan(mouth_angle / 2 * 1.02)), h=outer_ball_radius);
      }
      for (i = [0 : socket_notches - 1]) {
        rotate(i * (360 / socket_notches)) {
          if (flat_top) {
            translate([-(socket_thickness + additional_slot_thickness) / 2, 0, -delta_z]) {
              cube([socket_thickness + additional_slot_thickness, outer_ball_radius, 2 * delta_z]);
            }
          } else {
            rotate(90, [1, 0, 0]) {
              translate([0, 0, -outer_ball_radius]) {
                bj_square_pyramid(socket_thickness + additional_slot_thickness, 2 * outer_ball_radius / tan(mouth_angle/2), outer_ball_radius);
              }
            }
          }
        }
      }
    }
  }
}

