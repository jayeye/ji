$fn=60;

plate_height = 10;
thickness = 1.2;
plate_size = 200;
beam_width = 40;

outer_corner = plate_size * (4 + sqrt(2) / 2) / 10;
inner_corner = (plate_size - 2*beam_width) * (4 + sqrt(2) / 2) / 10;

echo((outer_corner - inner_corner)*1.414);

pad_center = (plate_size - beam_width) / 2;
pad_radius = 16;
pad_thickness = 8;

// keep these in sync with soldernut.scad
nut_thread_outer_diameter     	                = 25.4 / 2;
nut_diameter    				= nut_thread_outer_diameter + 4.8;

module shape() {
  minkowski() {
    square([.8, .8], center=true);
    circle(r=.1);
  }
}   

module frame() {
  linear_extrude(height=plate_height) {
    difference() {
      scale(plate_size) shape();
      scale(plate_size - beam_width * 2) shape();
    }
  }
}

module negframe() {
  linear_extrude(height=(plate_height - thickness)) {
    difference() {
      scale(plate_size - thickness * 2) shape();
      scale(plate_size - beam_width * 2 + thickness * 2) shape();
    }
  }
}

module half_grid(size, spacing) {
  translate([0, -size / 2, 0]) {
    for (i = [-size / 2 : spacing : size / 2]) {
      translate([i, 0, 0]) {
        cube([thickness, size, plate_height]);
      }
    }
  }
}

module crosshatch(size, spacing) {
  intersection() {
    frame();
    union() {
      rotate(45) half_grid(size, spacing);
      rotate(-45) half_grid(size, spacing);
    }
  }
}

module pad(hollow=true) {
  difference() {
    cylinder(r=(pad_radius + (hollow ? thickness : thickness / 2)), h=plate_height);
    if (hollow) {
      cylinder(r=pad_radius, h=pad_thickness);
    }
  }   
}

module four_pads(hollow=true) {
  for (i = [-1, 1]) {
    for (j = [-1, 1]) {
      translate([i * (outer_corner + inner_corner) / 2,
                 j * (outer_corner + inner_corner) / 2,
                 0]) {
        pad(hollow);
      }
    }
  }
}


module nut_placeholder(hollow=true) {
  if (hollow) {
    import("soldernut.stl");
//    import("mocknut.stl");
  } else {
    cylinder(r=(nut_diameter/2 - thickness / 2), h=plate_height);
  }
}
    
module four_nuts(hollow=true) {
  for (i = [-1, 1]) {
    for (j = [-.175, 0, .175]) {
      translate([i * (plate_size - beam_width) / 2,
                 j * plate_size,
                 0]) nut_placeholder(hollow);
      translate([j * plate_size,
                 i * (plate_size - beam_width) / 2,
                 0]) nut_placeholder(hollow);
    }
  }    
}

module run() {
  difference()  {
    union() {
      difference() {
        frame();
        negframe();
      }
    crosshatch(plate_size * sqrt(2), plate_size * sqrt(2) / 28);
    }
    four_pads(hollow=false);
    four_nuts(hollow=false);
  }
  four_pads();
  four_nuts();
}

run();
