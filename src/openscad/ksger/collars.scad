// Dimensions for my KSGER handle:
// Outer diameter: 13.9mm
// Shaft diameter: 11.9mm
// Shaft length: 60mm

$fn=60;

// Test for various diameters to see what actually fits.
module collar_test() {
  thickness = 10;
  ds = [for (d = [12 : .4 : 15]) d];
  lds = len(ds);
  dmin = ds[0];
  dmax = ds[lds - 1];
  collar = 19.05;
  difference() {
    hull() {
      cylinder(r=collar / 2, h=thickness);
      translate([collar * (lds - 1), 0, 0]) {
        cylinder(r=collar / 2, h=thickness);
      }
    }
    for (i = [0 : lds - 1]) {
      translate([collar * i, 0, 0]) {
        cylinder(r=ds[i] / 2, h=thickness);
      }
    }
  }
}
collar_test();
