inner_d1 = 72;
outer_d1 = 96;

inner_d2 = 81;
outer_d2 = 106;

height = 20;
screw_d=6.3;
screw_cent_d=8.3;

nib_x = 27;
nib_y = 8;

ring_xsp1 = -1;
rad_x = outer_d1/2 + ring_xsp1;
ring_xsp2 = rad_x - outer_d2/2;

brace_thick = 12;
inner_xpos1 = (outer_d1-inner_d1)/2+ring_xsp1/2+inner_d1;
inner_xpos2 = (outer_d2-inner_d2)/2+ring_xsp2/2+inner_d2;

// center cube1
ccube_x1 = (outer_d1-inner_d1)/2+(outer_d2-inner_d2)/2 + ring_xsp1 + ring_xsp2;
ccube_y1 = 32;

// center cube2
ccube_foot = 5;
ccube_x2 = ccube_x1-5;
ccube_y2 = ccube_y1;

// brim cube
bcube_x=40;
bcube_y=10;
bcube_x2=78;
bcube_y2=8;

hole_x = (outer_d1 + ring_xsp1/2) + (nib_x-(outer_d1-inner_d1)/2)/2-1;

notch_x=10;
notch_y=5;
notch_y_grad=0.0;

module Create_Cylinder(d=100,h=25,a=360){
rotate_extrude(angle=a,$fn = 50) {polygon( points=[[0,-h/2],[d/2,-h/2],[d/2,h/2],[0,h/2]] );}
}

module ring1() {
    difference() {
                cylinder(d=outer_d1, h=height, center=true, $fn=360);
                cylinder(d=inner_d1, h=height+1, center=true, $fn=360);
                translate([-outer_d1/2, -(outer_d1+2)/2, -(height+2)/2]) 
                    cube([outer_d1,(outer_d1+2)/2,height+2]);
            }    
}

module ring2() {
    difference() {
                cylinder(d=outer_d2, h=height, center=true, $fn=360);
                cylinder(d=inner_d2, h=height+1, center=true, $fn=360);
            }    
}

module notch() {
    polyhedron(
        points=[
                [-notch_x/2,-1,-height/2],
                [notch_x/2,-1,-height/2],
                [notch_x/2,-1,height/2],
                [-notch_x/2,-1,height/2],
                [-notch_x/2,notch_y,-height/2],
                [notch_x/2,notch_y,-height/2],
                [notch_x/2,notch_y-notch_y_grad,height/2],
                [-notch_x/2,notch_y-notch_y_grad,height/2],
                ],
        faces =[
                [0,3,2,1],
                [1,2,6,5],
                [5,6,7,4],
                [4,7,3,0],
                [6,2,3,7],
                [0,1,5,4],
            
    ]);
}

difference() {
    union() {
        translate([-outer_d1/2-ring_xsp1, 0, 0]) ring1();
        translate([outer_d2/2+ring_xsp2, 0, 0]) ring2();
        translate([-25, 31, -height/2]) cube([bcube_x,bcube_y,height]);
        // center cube
        translate([-(outer_d1-inner_d1)/2-ring_xsp1, 0, -height/2]) cube([ccube_x1,ccube_y1,height]);
        translate([-(outer_d1-inner_d1)/2-ring_xsp1+ccube_foot, -ccube_y2, -height/2]) cube([ccube_x2,ccube_y2,height]);
        translate([-25, 30, -height/2]) cube([bcube_x,bcube_y,height]);
        translate([-47, outer_d1/2-bcube_y2, -height/2]) cube([bcube_x2,bcube_y2,height]);
        // nib
        rotate([0, 0, -0.8]) translate([-inner_xpos1-nib_x, 0, -height/2]) cube([nib_x,nib_y,height]);
    }
    // nib bottom spacing
    rotate([0, 0, -0.8]) translate([-111, -10, -height/2]) cube([nib_x+4,nib_y+3,height]);
    translate([0, 50, 0]) rotate([90, -50, 0]) cylinder(d=screw_cent_d, h=100);
    translate([hole_x+9, 15, 0]) rotate([90, 0, 0]) cylinder(d=screw_d, h=nib_y*2, $fn=100);
    translate([-hole_x, 15, 0]) rotate([90, 0, 0]) cylinder(d=screw_d, h=nib_y*2, $fn=100);
    // Notches
    translate([outer_d2/2+ring_xsp2, 0]) rotate([0, 0, -60]) translate([0, inner_d2/2, 0]) notch();
    translate([outer_d2/2+ring_xsp2, 0]) rotate([0, 0, -120-60]) translate([0, inner_d2/2, 0]) notch();
    translate([outer_d2/2+ring_xsp2, 0]) rotate([0, 0, 120-60]) translate([0, inner_d2/2, 0]) notch();
}


//translate([outer_d2/2+ring_xsp2, 0, 0]) rotate([0, -90, 55]) cylinder(d=screw_d, h=(outer_d1+20)/2, $fn=100);
//translate([outer_d2/2+ring_xsp2, 0, 0]) rotate([0, -90, 175]) cylinder(d=screw_d, h=(outer_d1+20)/2, $fn=100);
//translate([outer_d2/2+ring_xsp2, 0, 0]) rotate([0, -90, 295]) cylinder(d=screw_d, h=(outer_d1+20)/2, $fn=100);
