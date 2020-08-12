d=71;
h=25;
t1=2.5;
d2=86;
t2=4;
d3=80;

rotate_extrude(angle=360,$fn = 360) { polygon( 
    points=[
        [d/2,-h/2],
        [d3/2,-h/2],
        [d3/2,-h/2+t2],
        [d/2+t1,-h/2+t2],
        [d/2+t1,-h/2],
        [d/2+t1,h/2-t2],
        [d2/2,h/2-t2],
        [d2/2,h/2],
        [d/2,h/2]
    ] 
);}
