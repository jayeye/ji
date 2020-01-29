include <../lib/stdlib.scad>
include <../lib/threads.scad>

// Adaptor to use a KSGER handle with the Dremel drill press


$fn=60;

kCollarDiameter = 13.9;  // Update this after printing collars.scad
                         // and checking what fits best.
kCollarLength = 50;      // Don't overdo it!

// The threads at the end of the Dremel 4200 are 3/4x12.

kDremelEndCapTPI = 12;
kDremelEndCapMajorDiameterInches = 3 / 4;
kDremelEndCapThreadLengthInches = 1 / 2;
// This is useful to keep around:
// Dmin_in = Dmaj_in - (1 / tpi) * 5 * sqrt(3) / 8;

module holder(collar_diameter_mm, collar_length_mm, rounding_radius=2) {
  difference() {
    union() {
      english_thread(diameter=kDremelEndCapMajorDiameterInches,
                     threads_per_inch=kDremelEndCapTPI,
                     length=kDremelEndCapThreadLengthInches,
                     leadin=2);
      rotate_extrude() {
        hull() {
          thread_len = kDremelEndCapThreadLengthInches * 25.4;
          translate([0,
                     thread_len]) {
            square([rounding_radius,
                    rounding_radius]);
          }
          translate([0,
                     collar_length_mm - rounding_radius]) {
            square([rounding_radius,
                    rounding_radius]);
          }
          translate([thread_len - rounding_radius,
                     thread_len + rounding_radius]) {
            circle(r=rounding_radius);
          }
          translate([thread_len - rounding_radius,
                     collar_length_mm - rounding_radius]) {
            circle(r=rounding_radius);
          }
        }
      }
    }
    cylinder(r=collar_diameter_mm / 2, h=collar_length_mm);
  }
}

holder(13.9, 60);
