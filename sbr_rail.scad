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
  
  translate([-base_w/2,l,-axis]) 
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

module sbr_bearing(d=12, tolerance=0) {
  length = lookup(d, [
    [12,39],
    [16,45],
    [20,50],
    [25,65],
    [30,70],
    [35,80],
    [40,90],
    [50,110]
  ]);
  
  width = lookup(d, [
    [12,41],
    [16,45],
    [20,48],
    [25,60],
    [30,70],
    [35,80],
    [40,90],
    [50,120]
  ]);
  height = lookup(d, [
    [12,28],
    [16,33],
    [20,39],
    [25,47],
    [30,56],
    [35,63],
    [40,72],
    [50,92]
  ]);
  
  top_t = lookup(d, [
    [12,9],
    [16,9],
    [20,11],
    [25,14],
    [30,15],
    [35,18],
    [40,20],
    [50,25]
  ]);
  
  //distance from axis to top of bearing
  top_offset = lookup(d, [
    [12,17.5],
    [16,20],
    [20,23],
    [25,27],
    [30,33],
    [35,37],
    [40,42],
    [50,53]
  ]);
  
  translate([0,length,0]) rotate([90,0,0]) difference() {
    union() {
      // Top of bearing
      translate([-width/2,top_offset-top_t,0])
        cube([width, top_t, length]);
      // main body
      translate([-width/2+1,top_offset-height,0])
        cube([width-2,height,length]);
    }
    translate([0,0,-length/2]){
      // This takes out the bottom web
      hull() {
        rotate(a=[0,0,40])
          translate([0,-100,0])
            cube([0.1,100,length*2]);
        rotate(a=[0,0,-40])
          translate([0,-100,0])
            cube([0.1,100,length*2]);
      }
      // Axis of bearing
      cylinder(d=d+tolerance, h=length*2);
    }
  }
}
 
