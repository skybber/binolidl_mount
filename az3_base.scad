cone_x1=31;
cone_x2=60;
cone_y=225;
mscrew_y=145;
cone_h = 23;
screw_cent_d=8.3;
screw_d=6.3;
ring_y=20;
toler=0.6;
bspace=6;
sub_y=160;


difference() {
    union() {
        polyhedron(points=[[0,0,0],[cone_x2,0,0],[cone_x2,cone_y,0],[0,cone_y,0],
        [(cone_x2-cone_x1)/2,0,cone_h],[cone_x2-(cone_x2-cone_x1)/2,0,cone_h],[cone_x2-(cone_x2-cone_x1)/2,cone_y,cone_h],[(    cone_x2-cone_x1)/2,cone_y,cone_h]],
        faces =[[0,1,2,3],[4,5,1,0],[5,6,2,1],[6,7,3,2], [7,4,0,3],[7,6,5,4]]);
        translate([(cone_x2-cone_x1)/2, 0, cone_h]) cube([cone_x1,cone_y,7]);
    }
    translate([-1, bspace, 0]) cube([cone_x2+2,ring_y+toler,4]);
    translate([-1, cone_y-bspace-ring_y, 0]) cube([cone_x2+2,ring_y+toler,4]);
    translate([cone_x2/2, (cone_y-mscrew_y)/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_d, h=50, $fn=100);
    translate([cone_x2/2, cone_y-(cone_y-mscrew_y)/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_d, h=50, $fn=100);
    translate([cone_x2/2, bspace+ring_y/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_cent_d, h=50, $fn=100);
    translate([cone_x2/2, cone_y-(bspace+ring_y/2), -10]) rotate([0, 0, 0]) cylinder(d=screw_cent_d, h=50, $fn=100);
    translate([0, (cone_y-sub_y)/2, 0]) cube([cone_x2,sub_y,10]);
    translate([0, 50, 0]) cube([cone_x2,cone_y,31]);
}
