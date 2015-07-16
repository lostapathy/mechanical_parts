// Module to generated an SBR type linear rail, based on dimesions of
// http://amzn.com/B00BKWILCG.  May or may not work with other rails.
// Model will be aligned on the y-axis

module sbr_rail(d=12, l, tolerance=0) {
  base_w = lookup(d, [
    [12,30],
    [16,35],
    [20,45],
    [25,55],
    [30,60],
    [35,65],
    [40,75],
    [50,95]
  ]);
  
  axis = lookup(d, [
    [12,22.5],
    [16,25],
    [20,27],
    [25,38],
    [30,37],
    [35,43],
    [40,48],
    [50,62]
  ]);
  
  base_t = lookup(d, [
    [12,4],
    [16,5],
    [20,5],
    [25,6],
    [30,7],
    [35,8],
    [40,9],
    [50,11]
  ]);
  
  translate([-base_w/2,l,0]) 
    rotate([90,0,0]) {
      
      translate([base_w/2,axis,0])
        cylinder(d=d,h=l);
      //base
      cube([base_w,base_t,l]);
      
      //middle bit
      translate([(base_w-d)/2,0,0])
        cube([d,axis/2,l]);
      
      // triangle to form angles.
      linear_extrude(height=l)
        polygon(points=[[(base_w-d)/2,axis/2], [base_w/2,axis]   , [(base_w-d)/2+d,axis/2]]);
    }

}
