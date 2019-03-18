$fn=30;
use <../finger/finger.scad>

// Cooling fan for cards, supported from a finger in an empty slot.
// Author: JayEye <jayeye@gmail.com>
//
// For the latest version, look in
// https://github.com/jayeye/jum/tree/master/src/scad/fingerfan

finger_fan_bracket();
module finger_fan_bracket() {
  fan_size = 80;
  fan_hole_distance = 71.5;
  finger_thickness = .9;    // I print at .15 z-resolution, so I want these
  bracket_thickness = 2.1;  // to be multiples of Δz.
  bracket_fan_distance_from_case = 110 - fan_size / 2;
  bracket_fan_distance_from_cards = 12;

  bracket_phi = atan2(bracket_fan_distance_from_cards,
                      bracket_fan_distance_from_case);
  echo(bracket_phi);
  bracket_hypotenuse = sqrt(bracket_fan_distance_from_cards *
                            bracket_fan_distance_from_cards +
                            bracket_fan_distance_from_case * 
                            bracket_fan_distance_from_case);
  finger_full_z = (18.8 + 2.8);  // AL + LJ
  finger_full_x = 11.5;  // NO

    // finger pad
  color("blue") {
    union() {
      translate([-finger_thickness, 0, finger_full_z]) {
        rotate(90, [1, 0, 0]) {
          linear_extrude(height=bracket_thickness) finger_top();
        }
      }
      scale([-1, -1, 1]) {
        cube([finger_thickness, bracket_thickness, finger_full_z]);
        cube([finger_thickness + finger_full_x, bracket_thickness, finger_full_z/2]);
      }
    }
  }  
    // actual bracket
  rotate((90 - bracket_phi)) {
    translate([-bracket_thickness, 0, 0]) {
      rotate(90, [1, 0, 0]) {
        union() {
          color("green") {
            linear_extrude(height=bracket_hypotenuse,
                           scale=[1, fan_size / finger_full_z]) {
              square([ bracket_thickness, finger_full_z]);
            }
          }
          color("red") {
            translate([0, fan_size, bracket_hypotenuse]) {
              rotate(bracket_phi, [0, 1, 0]) {
                translate([0, -fan_size/2, fan_size/2]) {
                  rotate(90, [0, 1, 0]) {
                    fan_frame(frame_thickness=bracket_thickness);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  // show, but probably don't print, the actual finger
  %translate([0, finger_thickness, finger_full_z]) {
    rotate(-90, [0, 1, 0]) {
      rotate(-90) {
        finger_full(finger_thickness);
      }
    }
  }  
}

module fan_frame(
  frame_thickness=1,
  fan_size=80,
  hole_distance=71.5,
  hole_diameter=4.8,  // this is the hole of the *bracket*, not the fan itself!
) {
  stud_radius = (fan_size - hole_distance) / 2;
  difference() {
    // ++++++++
    union() {
      translate([-fan_size / 2, -fan_size / 2, 0]) {
        cube([fan_size, fan_size, frame_thickness]);
      }
      for (x = [-hole_distance / 2, hole_distance / 2]) {
        for (y = [-hole_distance / 2, hole_distance / 2]) {
          translate([x, y, frame_thickness]) {
            cylinder(r=stud_radius, h=frame_thickness);
          }
        }
      }
    }
    // --------
    for (x = [-hole_distance / 2, hole_distance / 2]) {
      for (y = [-hole_distance / 2, hole_distance / 2]) {
        translate([x, y, 0]) {
          cylinder(r=(hole_diameter / 2), h=(2 * frame_thickness));
        }
      }
    }
    cylinder(r=((fan_size - 2) / 2), h = frame_thickness);
  }
}





