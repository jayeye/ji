// Cooling fan for cards, supported from a finger in an empty slot.
// Author: JayEye <jayeye@gmail.com>
//
// For the latest version, look in
// https://github.com/jayeye/jum/tree/master/src/scad/fingerfan

$fan_size = 80;
$hole_distance = 71.5;
$hole_diameter = 4.5;

$bracket_length = 140;
$bracket_width = 50;

$thickness = 2;

module fan_frame(fan_size=$fan_size, hole_distance=$hole_distance, hole_diameter=$hole_diameter, thickness=$thickness) {
  stud_radius = (fan_size - hole_distance) / 2;
  difference() {
    union() {
      translate([-fan_size / 2, -fan_size / 2, 0]) {
        cube([fan_size, fan_size, thickness]);
      }
      for (x = [-hole_distance / 2, hole_distance / 2]) {
        for (y = [-hole_distance / 2, hole_distance / 2]) {
          translate([x, y, thickness]) {
            cylinder(r=stud_radius, h=thickness);
          }
        }
      }
    }
  
    for (x = [-hole_distance / 2, hole_distance / 2]) {
      for (y = [-hole_distance / 2, hole_distance / 2]) {
        translate([x, y, 0]) {
          cylinder(r=(hole_diameter / 2), h=(2 * thickness));
        }
      }
    }
  
    cylinder(r=((fan_size - 2) / 2), h = thickness);
  }
}

module bracket(fan_size=$fan_size, thickness=$thickness, bracket_length=$bracket_length, bracket_width=$bracket_width) {
  module _slot() {
    hull() {
      translate([0,  5, 0]) cylinder(r=1.5, h=thickness);
      translate([0, -5, 0]) cylinder(r=1.5, h=thickness);
    }
  }

  module _quarter_poly() {
    polygon(points=[[-bracket_length / 2, 0],
                    [-bracket_length / 2, -bracket_width / 2],
                    [-fan_size /2, -fan_size /2],
                    [-fan_size /2, 0],],
            paths=[[0, 1, 2, 3]]);
  }

  module _poly() {
    for (x = [-1, 1]) {
      for (y = [-1, 1]) {
        scale([x, y, 1]) {
          _quarter_poly();
        }
      }
    }
  }

  difference() {
    linear_extrude(height=thickness) {
      _poly();
    }
          

*    translate([-bracket_length / 2, -bracket_width / 2, 0]) {
      cube([bracket_length, bracket_width, thickness]);
    }
    for (x = [-(bracket_length / 2 - 5), (bracket_length / 2 - 5)]) {
      for (y = [-12, 12]) {
        translate([x, y, 0]) {
          _slot();
        }
      }
    }
    cylinder(r=((fan_size - 2) / 2), h = thickness);
  }
}

module _hul() {
    union() {
      fan_frame();
      bracket();
    }
//    translate([0, 0, -10]) cube([$bracket_length - 10, $bracket_width - 6, 1], center=true);

}

*  _hul();

* fan_frame();