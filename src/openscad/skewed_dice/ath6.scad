
r = 15;                         // "radius", for some value of "radius"
h1 = r * sqrt(2)/2;             // height of lower three vertices

k1 = 8/7;                       // skew factor 1
k2 = 5/7;                       // skew factor 2
                                // if k1 == k2 == 1, you get a cube!

p0 = [0, 0, 0];
p1 = [cos(  0) * r, sin(  0) * r, h1];
p3 = [cos(120) * r, sin(120) * r, h1];
p5 = [cos(240) * r, sin(240) * r, h1];
p2 = k1 * p1 + k2 * p3;
p4 = k1 * p3 + k2 * p5;
p6 = k1 * p5 + k2 * p1;
p7 = [0, 0, p2[2] + p5[2]];
all_points = [p0, p1, p2, p3, p4, p5, p6, p7];

f1 = [0, 1, 2, 3];
f2 = [0, 3, 4, 5];
f3 = [0, 5, 6, 1];
f4 = [7, 4, 3, 2];
f5 = [7, 6, 5, 4];
f6 = [7, 2, 1, 6];
all_faces = [f1, f2, f3, f4, f5, f6];

module q() {
  polyhedron(points=all_points, faces=all_faces);
}

module pips(k, face) {
  // put `k` pips on `face`

  a = all_points[face[0]];
  b = all_points[face[1]];
  c = all_points[face[2]];
  d = all_points[face[3]];

  m = 4.5;                      // adjust to taste
  pip0 = (a + b + c + d)/4;
  if ((k % 2) == 1) {
    translate(pip0) children();
  }
  pip1 = (b + (m - 1) * d) / m;
  pip2 = (d + (m - 1) * b) / m;
  if (k > 1) {
    translate(pip1) children();
    translate(pip2) children();
  }
  pip3 = (a + (m - 1) * c) / m;
  pip4 = (c + (m - 1) * a) / m;
  if (k > 3) {
    translate(pip3) children();
    translate(pip4) children();
  }
  pip5 = ((a + b) / 2 + (c + d) * (m - 1) / 2) / m;
  pip6 = ((c + d) / 2 + (a + b) * (m - 1) / 2) / m;
  if (k > 5) {
    translate(pip5) children();
    translate(pip6) children();
  }
}

module s() {
  color("black") sphere(r=1, $fn=30);
}

// Animation parameters
// rotate([2880 * $t, 1080 * $t, 720 * $t]) translate(-.5 * p7)

difference() {
  q();
  pips(1, f1) s();
  pips(2, f2) s();
  pips(3, f3) s();
  pips(4, f4) s();
  pips(5, f6) s();
  pips(6, f5) s();
}
