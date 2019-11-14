$fn=90;

// Regular dodecahedron
phi = (1 + sqrt(5)) / 2;
points12 = 1 / sqrt(3) * [
            [      -1,      -1,      -1],
            [      -1,      -1,       1],
            [      -1,       1,      -1],
            [      -1,       1,       1],
            [       1,      -1,      -1],
            [       1,      -1,       1],
            [       1,       1,      -1],
            [       1,       1,       1],
            [       0,     phi, phi - 1],
            [       0,     phi, 1 - phi],
            [       0,    -phi, phi - 1],
            [       0,    -phi, 1 - phi],
            [ phi - 1,       0,     phi],
            [ 1 - phi,       0,     phi],
            [ phi - 1,       0,    -phi],
            [ 1 - phi,       0,    -phi],
            [     phi, phi - 1,       0],
            [     phi, 1 - phi,       0],
            [    -phi, phi - 1,       0],
            [    -phi, 1 - phi,       0],
            ];
faces12=[
         [ 0, 11, 10,  1, 19],
         [ 0, 15, 14,  4, 11],
         [ 0, 19, 18,  2, 15],
         [ 1, 10,  5, 12, 13],
         [ 1, 13,  3, 18, 19],
         [ 2,  9,  6, 14, 15],
         [ 2, 18,  3,  8,  9],
         [ 3, 13, 12,  7,  8],
         [ 4, 14,  6, 16, 17],
         [ 4, 17,  5, 10, 11],
         [ 5, 17, 16,  7, 12],
         [ 6,  9,  8,  7, 16],
         ];


// Regular Icosahedron
lat20 = atan2(1, 2);
elv20 = 90 - lat20;
coselv20 = cos(elv20);
sinelv20 = sin(elv20);
v201 = [for (a = [0 : 72 : 359])
        [cos(a)*sinelv20, sin(a)*sinelv20, coselv20]];
v202 = [for (a = [36 : 72 : 359])
        [cos(a)*sinelv20, sin(a)*sinelv20, -coselv20]];
points20 = concat([[0, 0, 1]], v201, v202, [[0, 0, -1]]);
faces20 = [
           [ 0,  1,  2],
           [ 0,  2,  3],
           [ 0,  3,  4],
           [ 0,  4,  5],
           [ 0,  5,  1],
           [ 1,  6,  2],
           [ 2,  7,  3],
           [ 3,  8,  4],
           [ 4,  9,  5],
           [ 5, 10,  1],
           [ 6,  7,  2],
           [ 7,  8,  3],
           [ 8,  9,  4],
           [ 9, 10,  5],
           [10,  6,  1],
           [11, 10,  9],
           [11,  9,  8],
           [11,  8,  7],
           [11,  7,  6],
           [11,  6, 10]
           ];

module polydreidel(points, faces, radius) {
  scaled_points = radius * points;
  function measure(x) = sqrt(x*x);

  // translate to t and rotate so that p is the new x axis
  // and n is the new z axis
  module translate_rotate_normal(t, p, n) {
    len = measure(n);
    phi = acos(n[2] / len);  // elevation is rotation around y axis
    theta = atan2(n[1], n[0]);  // azimuth is rotation around z axis
    translate(t) rotate([0, phi, theta]) children();
  }

  function x(face) = (scaled_points[faces[face][0]] -
                      scaled_points[faces[face][1]]);
  function n3(face) = (scaled_points[faces[face][0]] +
                       scaled_points[faces[face][1]] +
                       scaled_points[faces[face][2]]) / 3;
  function n5(face) = (scaled_points[faces[face][0]] +
                       scaled_points[faces[face][1]] +
                       scaled_points[faces[face][2]] +
                       scaled_points[faces[face][3]] +
                       scaled_points[faces[face][4]]) / 5;
  oneface = len(faces[0]);
  nghs = ["ש", "ה", "ג", "נ"];
  difference() {
    minkowski() {
          sphere(r=radius / 10);
          polyhedron(points=scaled_points, faces=faces);
        }
    for (i = [0 : len(faces) - 1]) {
      n = (oneface == 3 ? n3(i) : n5(i));
      translate_rotate_normal(n, x(i), n) {
        linear_extrude(radius / 10 + .01) {
          text(nghs[i % 4],
               size=radius / 2.5,
               font="Noto Serif Hebrew:style=Bold",
               valign="center",
               halign="center");
        }
      }
    }
  }
}

*polydreidel(points20, faces20, 20);
polydreidel(points12, faces12, 20);
