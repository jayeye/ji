$fn=30;
use <../finger/finger.scad>

// Cooling fan for cards, supported from a finger in an empty slot.
// Author: JayEye <jayeye@gmail.com>
//
// For the latest version, look in
// https://github.com/jayeye/jum/tree/master/src/scad/fingerfan

//finger_fan_bracket();

z_shift = -20;  // move the works down

//module finger_fan_bracket() {
  fan_size = 80;
  fan_hole_distance = 71.5;
  finger_thickness = .9;    // I print at .15 z-resolution, so I want these to be multiples of Δz.
  fan_frame_padding = 4;    // how much more plastic to put around the fan.

  bracket_tab_thickness = 4.2;

  bracket_thickness = bracket_tab_thickness;  //
  bracket_fan_distance_from_case = 110 - fan_size / 2;
  bracket_fan_distance_from_cards = 15;

  finger_full_z = (18.8 + 2.8);  // AL + LJ
  finger_full_x = 11.5;  // NO

  bottom_drop = (z_shift < 0) ? -z_shift : 0;
  top_raise = (z_shift > 0) ? z_shift : 0;


  llx = finger_full_x;
  llz = finger_full_z + bottom_drop - (3.2 + 4.4 * 1.5);
  urx = bracket_fan_distance_from_case;
  urz = 2 * fan_frame_padding + top_raise + fan_size;
  dx = urx - llx;
  dz = urz - llz;

  scale([1, -1, 1]) {
    // finger pad
    color("blue")
    union() {
      translate([finger_full_x, bracket_tab_thickness, finger_full_z + bottom_drop]) {
        rotate(90, [1, 0, 0]) {
          linear_extrude(height=bracket_tab_thickness) finger_top();
        }
      }
      cube([finger_full_x, bracket_tab_thickness, finger_full_z/2 + bottom_drop]);
    }

    cube([finger_full_x, bracket_fan_distance_from_cards, llz]);

    translate([0, bracket_fan_distance_from_cards, 0]) {
      cube([bracket_fan_distance_from_case, bracket_thickness, llz]);
      translate([bracket_fan_distance_from_case, 0, 0]) {
      // padding around the fan
        difference() {
          cube([2 * fan_frame_padding + fan_size, bracket_thickness, 2 * fan_frame_padding + fan_size + top_raise]);
  	  translate([fan_frame_padding + .1, 0, fan_frame_padding + top_raise + .1]) {
              cube([fan_size - .2, bracket_thickness, fan_size - .2]);    
            }
          }
        translate([fan_frame_padding, 0, fan_frame_padding + top_raise]) {
          rotate(90) {
            translate([0, -fan_size/2, fan_size/2]) {
              rotate(90, [0, 1, 0]) {
                fan_frame(frame_thickness=bracket_thickness);
              }
            }
          }
        }
      }
      phi = atan2(dz, dx);
      dr = sqrt(dx*dx + dz*dz);
      translate([llx, 0, llz]) {
        intersection() {
          cube([dx, bracket_thickness, dz]);
          rotate(90-phi, [0, 1, 0]) {
            cube([bracket_thickness, bracket_thickness, dr]);
          }
        }
      }    
    }
  }


  // show, but probably don't print, the actual finger
  *translate([0, finger_thickness, finger_full_z + bottom_drop]) {
    rotate(-90, [0, 1, 0]) {
      rotate(-90) {
        finger_full(finger_thickness);
      }
    }
  }  
//}

module fan_frame(
  frame_thickness=1,
  fan_size=80,
  hole_distance=71.5,
  hole_diameter=4.8,  // this is the hole of the *bracket*, not the fan itself!
  raised_studs=0,
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
            cylinder(r=stud_radius, h=raised_studs);
          }
        }
      }
    }
    // --------
    for (x = [-hole_distance / 2, hole_distance / 2]) {
      for (y = [-hole_distance / 2, hole_distance / 2]) {
        translate([x, y, 0]) {
          cylinder(r=(hole_diameter / 2), h=(frame_thickness + raised_studs));
        }
      }
    }
    cylinder(r=((fan_size - 2) / 2), h = frame_thickness);
  }
}
