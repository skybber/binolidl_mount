cone_x1=31;
cone_x2=77;
cone_x3=44;
cone_y=225;
cone_h = 23;
cone_h2 = 67;
mscrew_y1=145;
mscrew_y2=73;
screw_cent_d=8.3;
screw_d=6.3;
ring_y=20;
toler=0.6;
bspace=6;
bcube_h=7;
sub_y=160;
sub_y2=130;
d=-100;
cut_h=4;

module rect_cut(){
    polyhedron(
        points=[
                [0,bspace,cone_h+bcube_h],
                [cone_x3,bspace,cone_h2+bcube_h],
                [cone_x3,bspace+ring_y,cone_h2+bcube_h],
                [0,bspace+ring_y,cone_h+bcube_h],

                [0+cut_h,bspace,cone_h+bcube_h-cut_h],
                [cone_x3+cut_h,bspace,cone_h2+bcube_h-cut_h],
                [cone_x3+cut_h,bspace+ring_y,cone_h2+bcube_h-cut_h],
                [0+cut_h,bspace+ring_y,cone_h+bcube_h-cut_h],
                ],
        faces =[
                [0,3,2,1],
                [1,2,6,5],
                [5,6,7,4],
                [0,4,7,3],
                [0,1,5,4],
                [2,3,7,6],
    ]);
}

difference() {
    union() {
        polyhedron(
            points=[[(cone_x2-cone_x1)/2,0,bcube_h],
                    [cone_x2-(cone_x2-cone_x1)/2,0,bcube_h],
                    [cone_x2-(cone_x2-cone_x1)/2,cone_y,bcube_h],
                    [(cone_x2-cone_x1)/2,cone_y,bcube_h],
                    [0,0,cone_h+bcube_h],
                    [cone_x2,0,cone_h+bcube_h],
                    [cone_x3,0,cone_h2+bcube_h],
                    [cone_x2,cone_y,cone_h+bcube_h],
                    [cone_x3,cone_y,cone_h2+bcube_h],
                    [0,cone_y,cone_h+bcube_h]
                    ]
                    ,
            faces =[[0,1,2,3],
                    [4,6,5,1,0],
                    [5,7,2,1],
                    [6,8,7,5],
                    [9,8,6,4],
                    [3,9,4,0],
                    [2,7,8,9,3]
        ]);
        translate([(cone_x2-cone_x1)/2, 0, 0]) cube([cone_x1,cone_y,bcube_h]);
    }
    rect_cut();
    translate([0, (cone_y+sub_y)/2, 0]) rect_cut();
    
    translate([cone_x2/2, (cone_y-mscrew_y1)/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_d, h=50, $fn=100);
    translate([cone_x2/2, (cone_y-mscrew_y2)/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_d, h=50, $fn=100);
    translate([cone_x2/2, cone_y-(cone_y-mscrew_y1)/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_d, h=50, $fn=100);
    translate([cone_x2/2, cone_y-(cone_y-mscrew_y2)/2, -10]) rotate([0, 0, 0]) cylinder(d=screw_d, h=50, $fn=100);
    translate([0, bspace+ring_y/2, bcube_h]) rotate([0, -45, 0]) translate([cone_x2-(cone_x2-cone_x1)/2,0,-60]) cylinder(d=screw_cent_d, h=100, $fn=100);
    translate([0, cone_y-(bspace+ring_y/2), bcube_h]) rotate([0, -45, 0]) translate([cone_x2-(cone_x2-cone_x1)/2,0,-60]) cylinder(d=screw_cent_d, h=100, $fn=100);
    translate([0, (cone_y-sub_y)/2, cone_h2+bcube_h-60]) cube([cone_x2,sub_y,60]);
    //translate([0, (cone_y-sub_y2)/2, cone_h2+bcube_h-69]) cube([cone_x2,sub_y2,80]);
    //translate([0, 85, 0]) cube([80,225,80]);
}

