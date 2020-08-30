inner_d = 74;
t=2;
height = 60;

wedge_x1 = 0;
wedge_x2 = 4.5;
wedge_x3 = 3;
wedge_y = 10-0.5;

module wedge() {
    polyhedron(
        points=[
                [wedge_x1,-wedge_y/2,-height/2],
                [wedge_x2,-wedge_y/2,-height/2],
                [wedge_x3,-wedge_y/2,height/2],
                [wedge_x1,-wedge_y/2,height/2],
                [wedge_x1,wedge_y/2,-height/2],
                [wedge_x2,wedge_y/2,-height/2],
                [wedge_x3,wedge_y/2,height/2],
                [wedge_x1,wedge_y/2,height/2],
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

union() {
    translate([-1, 0, 0])  rotate([0, 0, -20]) rotate_extrude(angle=40,$fn = 360) { polygon( 
            points=[
                [inner_d/2,-height/2],
                [inner_d/2+t,-height/2],
                [inner_d/2+t,height/2],
                [inner_d/2,height/2],
            ] 
    );}
    translate([37.5,0,0]) wedge();
}
