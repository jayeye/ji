%import("Base_18x18cm_16holes.stl");

plate_thickness = 10;
plate_size = 180;
beam_width = 25.4;
bolt_diameter = 12.7;  // 1/2''
//bolt_diameter = 12;  // M12
nut_diameter = 19.05;  // 1/2'' nut flat-to-flat
//nut_diameter = 18;   // M12
slot_thickness = plate_thickness / 2;
exponent = 2.5;

function y(x) = pow((1 - pow(abs(x), exponent)), 1/exponent);


module frame() {
   difference() {
        scale(plate_size / 2) polygon(perimeter);
         big_hole(1, 1);
         big_hole(1, -1);
         big_hole(-1, 1);
         big_hole(-1, -1);
        //scale(plate_size / 2 - beam_width) polygon(perimeter);
    }
    //square([beam_width, plate_size], center=true);
}

module bolt_slot_nut() {
    translate([beam_width, 0]) circle(r=nut_diameter/2, $fn=60);
}

module bolt_slot_bolt() {
    translate([beam_width, 0]) circle(r=nut_diameter/2, $fn=6);
}

module cross_beam() {
    difference() {
        square([beam_width, plate_size - beam_width], center=true);
    }
}

perimeter = [
for (t = [0:360]) [cos(t), ((t > 180) ? -1 : 1) * y(cos(t))]];


linear_extrude(height=plate_thickness) {
    frame();
    cross_beam();
 }
//bolt_slot_nut();

module big_hole(i, j) {
    radius = (plate_size - 3 * beam_width) / 4;
    center = beam_width / 2 + radius;
    scale([i, j])
        translate([center, center])
            scale(radius)
                polygon(perimeter);
}

