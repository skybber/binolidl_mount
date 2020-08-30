height=20.1;
wedge_z1 = 0;
wedge_z2 = 5.5;
wedge_z3 = 5;
wedge_y = 10-0.5;
foot_z = 8;

module wedge() {
    polyhedron(
        points=[
                [-height/2,-wedge_y/2, wedge_z1],
                [-height/2,-wedge_y/2, wedge_z2],
                [height/2,-wedge_y/2, wedge_z3],
                [height/2,-wedge_y/2, wedge_z1],
                [-height/2,wedge_y/2, wedge_z1],
                [-height/2,wedge_y/2, wedge_z2],
                [height/2,wedge_y/2, wedge_z3],
                [height/2,wedge_y/2, wedge_z1],
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

wedge();
translate([height/2, -wedge_y/2, -foot_z + wedge_z3]) cube([2, wedge_y, foot_z]);
translate([-height/2-2, -wedge_y/2, -foot_z + wedge_z2]) cube([2, wedge_y, foot_z]);