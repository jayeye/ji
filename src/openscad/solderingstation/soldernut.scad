// Rendering the female threads in high resolution is very time consuming. 
// This file renders them once so that soldernut.stl can be included in the
// main code in solderingstation.scad. 
//
// render with: openscad soldernut.scad -o soldernut.stl
//
// Keep the nut_* parameters in sync with the main code.


// Code stolen from http://www.thingiverse.com/thing:193647

$fn=60;

// Make UNF 1/2'' female threads.
nut_thread_outer_diameter = 25.4 / 2;
nut_thread_step = 25.4 / 20;
nut_step_shape_degrees = 30;	
nut_resolution = .2;

// make nut slightly larger to account for printing inaccuracies, as the
// pitch is very close to the resolution of current printing nozzles.
// Set this to 0 if you have a 1/2x20 tap and are willing to use it.
nut_slack = 1.2;

// Enough thickness to plug the hole in the main board
nut_diameter = nut_thread_outer_diameter + 4.8;

// Same as plate_height
nut_height = 10;	

round_nut(
    nut_diameter,
    nut_height,
    nut_thread_step,
    nut_step_shape_degrees,
    nut_thread_outer_diameter + nut_slack, 
    nut_resolution);

// The rest is just the necessary modules to render hex_nut, which isn't even a hex hut!
/* From:
 *    polyScrewThread_r1.scad    by aubenc @ Thingiverse
 *
 * This script contains the library modules that can be used to generate
 * threaded rods, screws and nuts.
 *
 * http://www.thingiverse.com/thing:8796
 *
 * CC Public Domain
 */

module screw_thread(od,st,lf0,lt,rs,cs)
{
    or=od/2;
    ir=or-st/2*cos(lf0)/sin(lf0);
    pf=2*PI*or;
    sn=floor(pf/rs);
    lfxy=360/sn;
    ttn=round(lt/st+1);
    zt=st/sn;

    intersection()
    {
        if (cs >= -1)
        {
           thread_shape(cs,lt,or,ir,sn,st);
        }

        full_thread(ttn,st,sn,zt,lfxy,or,ir);
    }
}

module round_nut(df,hg,sth,clf,cod,crs)
{

    difference()
    {
        cylinder(r=df/2, h=hg);
        screw_thread(cod,sth,clf,hg,crs,-2);
    }
}


module thread_shape(cs,lt,or,ir,sn,st)
{
    if ( cs == 0 )
    {
        cylinder(h=lt, r=or, $fn=sn, center=false);
    }
    else
    {
        union()
        {
            translate([0,0,st/2])
              cylinder(h=lt-st+0.005, r=or, $fn=sn, center=false);

            if ( cs == -1 || cs == 2 )
            {
                cylinder(h=st/2, r1=ir, r2=or, $fn=sn, center=false);
            }
            else
            {
                cylinder(h=st/2, r=or, $fn=sn, center=false);
            }

            translate([0,0,lt-st/2])
            if ( cs == 1 || cs == 2 )
            {
                  cylinder(h=st/2, r1=or, r2=ir, $fn=sn, center=false);
            }
            else
            {
                cylinder(h=st/2, r=or, $fn=sn, center=false);
            }
        }
    }
}

module full_thread(ttn,st,sn,zt,lfxy,or,ir)
{
  if(ir >= 0.2)
  {
    for(i=[0:ttn-1])
    {
        for(j=[0:sn-1])
			assign( pt = [	[0,                  0,                  i*st-st            ],
                        [ir*cos(j*lfxy),     ir*sin(j*lfxy),     i*st+j*zt-st       ],
                        [ir*cos((j+1)*lfxy), ir*sin((j+1)*lfxy), i*st+(j+1)*zt-st   ],
								[0,0,i*st],
                        [or*cos(j*lfxy),     or*sin(j*lfxy),     i*st+j*zt-st/2     ],
                        [or*cos((j+1)*lfxy), or*sin((j+1)*lfxy), i*st+(j+1)*zt-st/2 ],
                        [ir*cos(j*lfxy),     ir*sin(j*lfxy),     i*st+j*zt          ],
                        [ir*cos((j+1)*lfxy), ir*sin((j+1)*lfxy), i*st+(j+1)*zt      ],
                        [0,                  0,                  i*st+st            ]	])
        {
            polyhedron(points=pt,
              		  triangles=[	[1,0,3],[1,3,6],[6,3,8],[1,6,4],
											[0,1,2],[1,4,2],[2,4,5],[5,4,6],[5,6,7],[7,6,8],
											[7,8,3],[0,2,3],[3,2,7],[7,2,5]	]);
        }
    }
  }
  else
  {
    echo("Step Degrees too agresive, the thread will not be made!!");
    echo("Try to increase de value for the degrees and/or...");
    echo(" decrease the pitch value and/or...");
    echo(" increase the outer diameter value.");
  }
}

