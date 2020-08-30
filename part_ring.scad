inner_d = 72;
outer_d1 = 81;
outer_d2 = 87;
outer_d3 = 90;

height = 65;
t=4;

rotate_extrude(angle=60,$fn = 360) { polygon( 
        points=[
            [inner_d/2,-height/2-t],
            [outer_d3/2,-height/2-t],
            [outer_d3/2,-height/2],
            [outer_d1/2,-height/2],
            [outer_d1/2,-height/2+20],
            [outer_d2/2,height/2],
            [outer_d3/2,height/2],
            [outer_d3/2,height/2+t],
            [inner_d/2,height/2+t],
        ] 
    );}
