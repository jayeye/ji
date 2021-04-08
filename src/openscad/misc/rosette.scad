module _leaf2d(radius, height, peak_offset=0) {
  coswave = concat([for (i = [0 : $fn])
                       [(cos(180 * i / $fn) + 1) * radius / 2,
                        (1 - i / $fn) * (height - radius)]],
                   [[0, height - radius]]);
  polygon(points=coswave);
  translate([0, height - radius]) {
    intersection() {
      square([radius, radius]);
      circle(r=radius);
    }
  }
}

module _raindrop(radius, height) {
  rotate([0, 90, 0]) {
    rotate_extrude() {
      _leaf2d(radius, height);
    }
  }
}

module _2draindrop(radius, height) {
  _leaf2d(radius, height);
  scale([-1, 1]) {
    _leaf2d(radius, height);
  }
}

module rosette(leaf_radius,
               leaf_length,
               middle_radius=-1,  // defaults to leaf_radius
               middle_height=-1,  // defaults to leaf_radius
               n_leaves=10,
               peak_offset=0,
               bottom_extension=0,
               trellis_width=0) {
  difference() {
    union() {
      for (theta = [0 : 360 / n_leaves : 359]) {
        rotate(theta) {
          translate([peak_offset, 0, 0]) {
            _raindrop(radius=leaf_radius,
                      height=leaf_length);
            rotate([180, 0, 90]) {
              linear_extrude(bottom_extension) {
                _2draindrop(radius=leaf_radius,
                            height=leaf_length);
              }
            }
          }
        }
      }
      scale([1,
             1,
             (middle_height == -1 ? leaf_radius : middle_height) /
             (middle_radius == -1 ? leaf_radius : middle_radius)]) {
        sphere(r=middle_radius == -1 ? leaf_radius : middle_radius);
      }
    }
    if (bottom_extension > 0 && trellis_width > 0) {
      translate([0, 0, -bottom_extension]) {
        cube([2 * (leaf_length + peak_offset),
              trellis_width,
              2 * trellis_width],
             center=true);
        cube([trellis_width,
              2 * (leaf_length + peak_offset),
              2 * trellis_width],
             center=true);
      }
    }
  }
}

rosette(leaf_radius=12,
        leaf_length=50,
        n_leaves=10,
        peak_offset=0,
        middle_radius=20,
        middle_height=12,
        bottom_extension=30,
        trellis_width=15,
        $fn=100);
