inner_d = 72;
outer_d = 74.5;

height = 20;
t=5;

module part_ring() {
    translate([inner_d/2, 0, 0]) rotate([0, 0, 6.7]) translate([-inner_d/2, 0, 0])  rotate_extrude(angle=60,$fn = 360) { polygon( 
        points=[
            [inner_d/2,-height/2],
            [inner_d/2+t,-height/2],
            [inner_d/2+t,height/2],
            [inner_d/2,height/2],
        ] 
    );}
}

difference() {
    union() {
        cylinder(d=outer_d, h=height, center=true, $fn=360);
        part_ring();
        rotate([0, 0, 120]) part_ring();
        rotate([0, 0, 240]) part_ring();
    }
    cylinder(d=inner_d, h=height+1, center=true, $fn=360);
}