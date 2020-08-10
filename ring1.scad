outer_d = 96;
inner_d = 72;
height = 20;
screw_d=6.3;
screw_cent_d=8.3;
nib_x = 27;
nib_y = 8;
ring_xsp = -1;
brace_thick = 12;
inner_xpos = (outer_d-inner_d)/2+ring_xsp+inner_d;

ccube_x = outer_d-inner_d+ring_xsp*2;
ccube_y = 25;

hole_x = (outer_d + ring_xsp/2) + (nib_x-(outer_d-inner_d)/2)/2-1;

module ring() {
    difference() {
                cylinder(d=outer_d, h=height, center=true, $fn=360);
                cylinder(d=inner_d, h=height+1, center=true, $fn=360);
                translate([-outer_d/2, -(outer_d+2)/2, -(height+2)/2]) 
                    cube([outer_d,(outer_d+2)/2,height+2]);
            }    
}

difference() {
    union() {
        translate([-outer_d/2-ring_xsp, 0, 0]) ring();
        translate([outer_d/2+ring_xsp, 0, 0]) ring();
        // ring brace
        translate([-(outer_d/2+ring_xsp), outer_d/2-brace_thick, -height/2]) cube([outer_d+ring_xsp,brace_thick,height]);
        // center cube
        translate([-ccube_x/2, 0, -height/2]) cube([ccube_x,ccube_y,height]);
        // nib 1
        rotate([0, 0, 0.8]) translate([inner_xpos, 0, -height/2]) cube([nib_x,nib_y,height]);
        // nib 2
        rotate([0, 0, -0.8]) translate([-inner_xpos-nib_x, 0, -height/2]) cube([nib_x,nib_y,height]);
    }
    rotate([0, 0, 0.8]) translate([80, -10, -10]) cube([nib_x+3,nib_y+3,height]);
    rotate([0, 0, -0.8]) translate([-110, -10, -10]) cube([nib_x+3,nib_y+3,height]);
    translate([0, 50, 0]) rotate([90, 0, 0]) cylinder(d=screw_cent_d, h=55);
    translate([hole_x, 15, 0]) rotate([90, 0, 0]) cylinder(d=screw_d, h=nib_y*2, $fn=100);
    translate([-hole_x, 15, 0]) rotate([90, 0, 0]) cylinder(d=screw_d, h=nib_y*2, $fn=100);
    translate([-4.1, 42.5, -4.1]) cube([8.2,5.5,8.2]);
}
