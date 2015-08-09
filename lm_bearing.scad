// Module to generated an LM8UU type linear bearing, based on dimesions of
// http://amzn.com/B008RIKN7W.  May or may not work with other bearings.
// Model will be aligned on the y-axis

module lm_bearing(d=8, tolerance=0) {
  length = lookup(d, [
    [8,24]
  ]);
  
  outside_d = lookup(d, [
    [8,15]
  ]);
  
  retainer_w = lookup(d, [
    [8,1.1]
  ]);
  
  retainer_spacing = lookup(d, [
    [8,12.5]
  ]);

  difference() {
    cylinder(d=outside_d, h=length);
    translate([0,0,-1])
      cylinder(d=d,h=length+2);
    
    translate([0,0,(length-retainer_spacing-retainer_w)/2]) {
      // the 1 mm recess depth is not to a spec
      lm_bearing_retainer_recess(retainer_w, outside_d-1);
      translate([0,0,retainer_spacing])
        lm_bearing_retainer_recess(retainer_w, outside_d-1);
    }
  }
}

module lm_bearing_retainer_recess(retainer_w,inner_d) {
  difference() {
    cylinder(h=retainer_w,d=inner_d*2);
    cylinder(h=retainer_w,d=inner_d);
  }
}
 
lm_bearing(8);
