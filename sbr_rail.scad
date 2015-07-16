// Module to generated an SBR type linear rail, based on dimesions of
// a cheap SBR12 rail.  May or may not work with other rails.

module sbr_rail(d=12, l=100, tolerance=0) {
  
  base_w = 2.5*d;
  
  translate([base_w/2,28.25-d/2,0])
    cylinder(d=d,h=l);
  //base
  cube([base_w,4.25,l]);
  
  //middle bit
  translate([(base_w-d)/2,0,0])
    cube([d,d,l]);
  
  // triangle to form angles.  The 2*d of the vertex is a guess
  linear_extrude(h=l)
    polygon(points=[[(base_w-d)/2,d], [base_w/2,2*d]   , [(base_w-d)/2+d,d]]);
  

}

sbr_rail(d=12, l=100);
