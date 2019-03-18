use <balljoint.scad>

bd = 40;   // ball diameter
sd = 20;   // stud diameter
sl = 30;   // stud length
th = 1.9;  // thickness
tl = .1;   // tolerance (space between ball and socket)
ma = 120;  // mouth angle

ssl = sl; // stud length for sockets


// Balls

*translate([bd, bd, 0]) {
  // should touch the tops, to verify that they are all at the same height.
  translate([-bd, 0, bd + sl]) cube([10*bd, 1, 1]);

  // test that it actually works!
  translate([0, 0, 0]) {
    bj_ball(
      ball_diameter=bd,
      stud_diameter=sd,
      stud_length=sl
    );
  }
  
  // invisibly thin stud
  translate([2*bd, 0, 0]) {
    bj_ball(
      ball_diameter=bd,
      stud_diameter=0,
      stud_length=sl
    );
  }

  // fat stud
  translate([4*bd, 0, 0]) {
    bj_ball(
      ball_diameter=bd,
      stud_diameter=bd,
      stud_length=sl
    );
  }

  // stud fatter than ball, should fail to print.
  translate([6*bd, 0, 0]) {
    bj_ball(
      ball_diameter=bd,
      stud_diameter=bd + 1,
      stud_length=sl
    );
  }

  // test horizontal hole
  translate([8*bd, 0, 0]) {
    bj_ball(
      ball_diameter=bd,
      stud_diameter=sd,
      stud_length=sl,
      hole_diameter=5
    );
  }


}
  
// Sockets

*translate([bd, 3 * bd, 0]) {

  // verify that it works
  translate([0, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=120);
  }
  
  // angled top, angled slots
  translate([2*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=120,
      flat_top=false);
  }

  // more notches
  translate([4*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=7,
      tolerance=tl,
      mouth_angle=120,
      flat_top=false);
  }

  // one notch!
  translate([6*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=1,
      tolerance=tl,
      mouth_angle=120,
      flat_top=false);
  }

  // no notches!
  translate([8*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=0,
      tolerance=tl,
      mouth_angle=120,
      flat_top=false);
  }

  // open wide
  translate([10*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=175,
      flat_top=false);
  }

  // bocca chiusa
  translate([12*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=1,
      flat_top=false);
  }

  // wafer-thin
  translate([14*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=0,
      socket_notches=4,
      tolerance=0,
      mouth_angle=1,
      flat_top=false);
  }

  // no stud
  translate([16*bd, 0, 0]) {
  %  bj_socket(ball_diameter=bd,
      stud_diameter=0,
      stud_length=ssl,
      socket_thickness=th,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=0.1,
      flat_top=false);
    translate([0, 0, ssl]) sphere();
    translate([0, 0, ssl + bd + 2*th + 2*tl]) sphere();
  }

  // thick slots
  translate([18*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      additional_slot_thickness=4,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=120);
  }

  // thick slots
  translate([20*bd, 0, 0]) {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      additional_slot_thickness=4,
      socket_notches=4,
      tolerance=tl,
      mouth_angle=120,
      flat_top=false);
  }



}

// Assembly!

group(){

  color("green") {
    bj_socket(ball_diameter=bd,
      stud_diameter=sd,
      stud_length=ssl,
      socket_thickness=th,
      additional_slot_thickness=(bd + 2*th + 2*tl) * 3.14 / 10,
      socket_notches=5,
      tolerance=tl,
      mouth_angle=120,
      flat_top=true);
  }


  color("red") {
    translate([0, 0, bd/2 + tl + th]) {  //center of ball is at center of socket
      translate([0, 0, ssl]) {  //center of ball is at top of stud
    rotate(($t < 0.5) ? ($t * 60 - 30) : (($t - .5) * 90), [0, 1, 0])
    rotate($t < 0.5 ? ($t * 90 - 45) : ($t - .5) * 90, [1, 0, 0])
        translate([0, 0, sl + bd/2]) {  // center of ball is at 0
          rotate(180, [1, 0, 0]) {
            bj_ball(
              ball_diameter=bd,
              stud_diameter=sd,
              stud_length=sl);
          }
        }
      }
    }
  }
}