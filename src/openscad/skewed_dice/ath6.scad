//
//             4-------------7
//            /|            /|
//           / |           / |
//          /  |          /  |
//         /   |         /   |
//        5-------------6    |
//        |    |        |    |
//        |    3--------|----2
//        |   /         |   /
//        |  /          |  /
//        | /           | /
//        |/            |/
//        O-------------1
//
// Start with a unit cube, the vertices labeled 0-7 as in the figure above.
// We denote the vector from vertex a to vertex b as |ab>.
// The cube is "standing" with its vertex 0 at the origin.
// Vertices 1, 3, and 5 are at azimuths 0°, 120°, and 240°, and elevation φ:
//
// Coordinates of vertices:
//
// v0: [0, 0, 0]
// v1: [cos(0)   * sin(φ), sin(0)   * sin(φ), cos(φ)]
// v3: [cos(120) * sin(φ), sin(120) * sin(φ), cos(φ)]
// v5: [cos(240) * sin(φ), sin(240) * sin(φ), cos(φ)]
//
// We are too lazy to look up the value of φ, so we compute it:
// vectors |01> and |03> are normal, hence their dot product is 0:
//
// cos(0)*cos(120)*sin^2(φ) + sin(0)*sin(120)*sin^2(φ) + cos^2(φ) = 0
// ∴ -1/2*sin^2(φ) + (1 - sin^2(φ)) = 0
// ∴ -1/2*sin^2(φ) - sin^2(φ) = -1
// ∴ sin(φ) = sqrt(2/3)
// ∴ cos(φ) = sqrt(1/3)

sinf = sqrt(2 / 3);
cosf = sqrt(1 / 3);
sq32 = sqrt(3) / 2;

// These are going to be *asymmetric* dice, but all six sides are identical.
// To achieve this, two adjacent edges have to be equal, and, WLG, normal.
//
// Now, let us compute the coordinates of points 2, 4, and 6:
// Take side [0123]: |01> and |03> are perpendicular to each other, and of
// length 1. We express vector |02> = u*|01> + w*|02>, and thus get
// the coordinates of point 2, and similarly for points 4 and 6.
//
// v2 = u * v1 + w * v3
// v4 = u * v3 + w * v5
// v6 = u * v5 + w * v1
//
// How about point 7? From symmetry, |74>, |75>, and |76> also have to be
// normal to each other, and of length 1, and from those, |24>, |46>, and |62>
// have to be of length sqrt(2).
//
// Let us rewrite the coordinates:
//
// v1 = [       sinf,            0, cosf]
// v3 = [-1/2 * sinf,  sq32 * sinf, cosf]
// v5 = [-1/2 * sinf, -sq32 * sinf, cosf]
// v2 = [ (u - w/2) * sinf,           w * sq32 * sinf, (u + w) * cosf]
// v4 = [  -(u + w) * sinf / 2, (u - w) * sq32 * sinf, (u + w) * cosf]
// v6 = [ (w - u/2) * sinf,          -u * sq32 * sinf, (u + w) * cosf]
//
//
//   |24> . |24> = 2   // dot product with itself gives the length squared(
// ∴ (|04> - |02>) . (|04> - |02>) = 2
// ∴ (v4 - v2) . (v4 - v2) = 2
// ∴ [(-u/2 - w/2 - u + w/2) * sinf, (u - w - w) * sq32 * sinf, 0] . [] = 2
// ∴ [-3/2 * u * sinf, (u - 2 * w) * sq32 * sinf, 0] . [] = 2
// ∴ 9/4 * u*u * sinf*sinf + (u*u + 4*w - 4*u*w) * sq32*sq32 * sinf*sinf = 2
// ∴ 9/4 * u*u * 2/3 + (u*u + 4*w*w - 4*u*w)*3/4*2/3 = 2
// ∴ 3/2 * u*u + 1/2 * u*u + 1/2 * 4 * w*w   - 1/2 * 4 * u*w = 2
// ∴ 2 * u * u + 2 * w * w - 2 * u * w = 2
// ∴ u*u + w*w - u*w = 1
//

function fu1(x) = (x + sqrt(4 - 3*x*x)) / 2;
function fu2(x) = (x - sqrt(4 - 3*x*x)) / 2;

// For S&G, we want u and w to be small fractions of small integers.
// Here is a nice pair:

u = 8/7;
w = 5/7;

// Let us rewrite the coordinates of the vertices.

v0 = [          0,            0,    0];
v1 = [       sinf,            0, cosf];
v3 = [-1/2 * sinf,  sq32 * sinf, cosf];
v5 = [-1/2 * sinf, -sq32 * sinf, cosf];
v2 = [ (u - w/2) * sinf,           w * sq32 * sinf, (u + w) * cosf];
v4 = [  -(u + w) * sinf / 2, (u - w) * sq32 * sinf, (u + w) * cosf];
v6 = [ (w - u/2) * sinf,          -u * sq32 * sinf, (u + w) * cosf];

// Now, let us validate that the angles between |24>, |26>, and |62> are 60°:

// echo(acos(((v4-v2) / metric(v4-v2)) * ((v6-v2) / metric(v6-v2))));
// echo(acos(((v6-v2) / metric(v6-v2)) * ((v6-v4) / metric(v6-v4))));
// echo(acos(((v2-v6) / metric(v2-v6)) * ((v2-v4) / metric(v2-v4))));

// Sure enough, they all print 60.
//
// How about v7? We have:
//   v7 has to be at distance 1 from v2, v6, and v4, and,
//   because of symmetry, lie on the z axis:
//
//   sqrt(((v7 - v2) . (v7 - v2))) = 1
// ∴ (v7 - v2) . (v7 - v2) = 1
// ∴ [-(u - w/2) * sinf,  - w * sq32 * sinf, z7 - (u + w) * cosf] . [] = 1
// ∴ (u - w/2)*(u - w/2)*sinf*sinf + w*w*sq32*sq32*sinf*sinf + (z7 - (u+w)*cosf)*(z7 - (u+w)*cosf) = 1
// ∴ (u*u + w*w/4 - u*w)*2/3 + w*w * 3/4 * 2/3 + z7*z7 - 2*z7*(u+w)*cosf + (u*u + 2u*w + w*w)*1/3 = 1
// ∴ u*u*2/3 + w*w/6 - u*w*2/3 + w*w*1/2 + z7*z7 - 2*z7*(u+w)*cosf + u*u*1/3 + u*w*2/3 + w*w*1/3 = 1
// ∴ z7*z7 - 2*z7*(u+w)*cosf + u*u*(2/3+1/3) + w*w*(1/6+1/2+1/3) + u*w*(-2/3+2/3) - 1 = 0
// ∴ z7*z7 - 2*z7*(u+w)*cosf + u*u + w*w - 1 = 0
// ∴ z7*z7 - 2*z7*(u+w)*cosf + u*w = 0

//
// D2 = (u*u + w*w + 2*u*w)*1/3 - u*w
//    = (u*u + w*w + 2*u*w)*1/3 - 3*u*w/3
//    = 1/3*(u*u + w*w + 2*u*w - 3*u*w)
//    = 1/3*(u*u + w*w - u*w)
//    = 1/3 = cosf

z7 = (u + w + 1)*cosf;
v7 = [0, 0, z7];

//
// Now we can actually design the dice:

r = 15;

p0 = [0, 0, 0];
p1 = r * [cos(  0) * sinf, sin(  0) * sinf, cosf];
p3 = r * [cos(120) * sinf, sin(120) * sinf, cosf];
p5 = r * [cos(240) * sinf, sin(240) * sinf, cosf];
p2 = u * p1 + w * p3;
p4 = u * p3 + w * p5;
p6 = u * p5 + w * p1;
p7 = r * [0, 0, (u + w + 1) * cosf];
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

// Let's figure out the locations of the pips.
//
//         ┌─────────────────────┐
//         │ D                 C │
//         │                     │
//         │    P2        P4     │
//         │                     │
//         │         P0          │
//         │                     │
//         │    P3        P1     │
//         │                     │
//         │ A                 B │
//         └─────────────────────┘
//
//
//   s = 1 / n
//
//   AB = (b - a)
//   BA = (a - b)
//   BC = (c - b)
//   CB = (b - c)
//   CD = (d - c)
//   DC = (c - d)
//   DA = (a - d)
//   AD = (d - a)
//
//   P0 = (a + b + c + d) / 4
//   P1 = b + s*BA + s*BC
//      = b + sa - sb + sc - sb
//   P2 = d + s*DA + s*DC
//      = d + sa - sd + sc - sd
//   P3 = a + s*AB + s*AD
//      = a + sb - sa + sd - sa
//   P4 = c + s*CD + s*CB
//      = c + sd - sc + sb - sc
//   P5 = (P1 + P4) / 2
//   P6 = (P2 + P3) / 2
//
//
module pips(k, face) {
  // put `k` pips on `face`

  a = all_points[face[0]];
  b = all_points[face[1]];
  c = all_points[face[2]];
  d = all_points[face[3]];

  s = 1/4.5;                      // adjust to taste
  pip0 = (a + b + c + d) / 4;
  if ((k % 2) == 1) {
    translate(pip0) children();
  }
  pip1 = b + s * (a - b + c - b);
  pip2 = d + s * (a - d + c - d);
  pip3 = a + s * (b - a + d - a);
  pip4 = c + s * (d - c + b - c);
  pip5 = (pip1 + pip4) / 2;
  pip6 = (pip2 + pip3) / 2;
  if (k > 1) {
    translate(pip1) children();
    translate(pip2) children();
  }
  if (k > 3) {
    translate(pip3) children();
    translate(pip4) children();
  }
  if (k > 5) {
    translate(pip5) children();
    translate(pip6) children();
  }
}

module pip() {
  color("black") sphere(r=r/12, $fn=30);
}

// Animation parameters
// rotate([2880 * $t, 1080 * $t, 720 * $t]) translate(-.5 * p7)


// We chamfer the edges to improve print quality. Sand them so they
// become radii.


function metric(x) = sqrt(x*x);

// translate to t and rotate so that n is the new z axis
module translate_rotate_normal(t, n) {
  len = metric(n);
  phi = acos(n[2] / len);  // elevation is rotation around y axis
  theta = atan2(n[1], n[0]);  // azimuth is rotation around z axis
  translate(t) rotate([0, phi, theta]) children();
}

// angle between vectors u and v
function angle(u, v) = acos((u[0]*v[0] + u[1]*v[1] + u[2]*v[2]) / (metric(u) * metric(v)));

// Chamfer edge |ab>, compute angle using edges |ac> and |ad>.
module chamfer(a, b, c, d) {
  translate_rotate_normal(a, b-a) {
    translate([0, 0, metric(b-a)/2]) {
      //      rotate(angle(c-a, d-a) / 2 + 45) {
        cube([$chamfer, $chamfer, metric(b-a)], center=true);
        //      }
    }
  }
}



$chamfer=r/20;

difference() {
  q();

  chamfer(p0, p1, p3, p5);
  chamfer(p0, p3, p5, p1);
  chamfer(p0, p5, p1, p3);
  chamfer(p7, p6, p4, p2);
  chamfer(p7, p4, p2, p6);
  chamfer(p7, p2, p4, p6);
  chamfer(p2, p1, p3, p7);
  chamfer(p1, p6, p2, p0);
  chamfer(p2, p3, p1, p7);
  chamfer(p3, p4, p0, p2);
  chamfer(p4, p5, p3, p7);
  chamfer(p5, p6, p0, p4);

  pips(1, f1) pip();
  pips(2, f2) pip();
  pips(3, f3) pip();
  pips(4, f4) pip();
  pips(5, f6) pip();
  pips(6, f5) pip();
}



// debugging aid
module dot(x, c) {
  translate(x) {
    color(c) {
      //            sphere(r=1, $fn=20);
    }
  }
}

dot(p0, "black");
dot(p1, "brown");
dot(p3, "orange");
dot(p5, "green");
dot(p2, "red");
dot(p4, "yellow");
dot(p6, "blue");
dot(p7, "purple");
