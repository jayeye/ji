// PC case Finger (slot cover)
// Author: JayEye <jayeye@gmail.com>
//
// For the latest version, look in
// https://github.com/jayeye/jum/tree/master/src/scad/finger
//
// The following dimensions are taken from
// http://www.lo-tech.co.uk/w/images/0/0b/RAM-and-EMS-Board-Slot-Bracket-r01.png
// All distances are in millimeters.
//
//
// Body, looking from the outside.
//                                                        B.-----.A
//                                                        /      |
//                                                       /       |
//            D.-------------------//-------------------'C       |
//            /                                                  |
//  F.-------'E                                                  |
//   |                                                           |
//   |                                                           |
//  G`-------.H                                          K.------'L
//            \                                          /
//            I`-------------------//-------------------'J
//
// Horizontal distances:
// AB: 2.8
// AC: 6.1
// AG: 120
// AH: 112.8
// AJ: 8.5
// AK: 5.7
//
// Vertical distances:
// AL: 18.8
// LJ: 2.8
// FG: 10.2
// JD: 18.3

module finger_front() {
  u = (18.3 - 10.2) / 2;

  A = [0, 0];
  B = A + [-2.8, 0];
  L = A + [0, -18.8];
  K = L + [-5.7, 0];
  J = [-8.5, K[1] - 2.8];
  H = [-112.8, J[1] + u];
  I = [H[0] + u, J[1]];
  G = [-120, H[1]];
  F = G + [0, 10.2];
  E = [H[0], F[1]];
  D = [I[0], J[1] + 18.3];
  C = A + [-6.1, D[1]];
  B = A + [-2.8, 0];

  Fa = F + [0, -1]; // chamfer the corners!
  Fb = F + [1, 0];

  Ga = G + [0, 1];
  Gb = G + [1, 0];

  polygon(points=[A, B, C, D, E, Fb, Fa, Ga, Gb, H, I, J, K, L],
          paths=[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]]);
}


// Tab, looking from above:
//
//  P.------.Q   V.---.M
//   |      |     |   |
//   |      |     |   |
//   |      R  S  T   |
//   |       \___/    |
//   |                |
//   |                |
//   |                |
//   |                |
//  O`----------------'N
//
// 
// Horizontal distances:
// PS: 6.4
// ON: 11.5
// QV: 4.4
//
// Vertical distances:
// MS: 3.2
// MN: 18.8
//
// S is the center of a semicircle.

module finger_top() {
  r = 4.4 / 2;

  M = [0, 0];
  N = M + [0, -18.8];
  O = N + [-11.5, 0];
  P = [O[0], 0];
  S = P + [6.4, -3.2];
  R = S + [-r, 0];
  T = S + [r, 0];
  Q = [R[0], 0];
  V = [T[0], 0];

  difference() {
    polygon(points=[M, N, O, P, Q, R, T, V],
            paths=[[0, 1, 2, 3, 4, 5, 6, 7]]);
    translate(S) circle(r=r);
  }
}

module finger_full(finger_thickness=1) {
  color("cyan")
    linear_extrude(height=finger_thickness) 
      finger_front();
  color("magenta")
    translate([0, 0, finger_thickness])
      rotate(90, [0, 1, 0])
        linear_extrude(height=finger_thickness)
          finger_top();
  color("yellow")
    scale([1, -1, 1])
      cube([finger_thickness, 18.8, finger_thickness]);
}

finger_full();
