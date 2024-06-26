

// build panel 
module build_panel(i, j, sunrise, solar_noon, sunset, datetext){
   
    //translate([15, 2, -2]) {linear_extrude(height = 6){text("OpenSCAD", font = "Liberation Sans:style=Bold Italic", size=1);}}


    // panel height 
    y = 24; 
    
    // panel width
    x = y/2; 
    

    
    // panel depth (arbitraty for laser cutting)
    z = 1;

    r1 = (sunset - sunrise)/2;
    
    translate([(x+1)*i, (y+1)*j, 0])
    

    difference(){
    cube(size = [x,y,z], center = true/false);
      
    

    translate([0, solar_noon, 0])
    cylinder(h=4*z, r1=r1, r2=r1, center=true, $fn=100);
    
    r_hole = 0.5;
    translate([4*r_hole, 4*r_hole,0])
    cylinder(h=4*z, r1 = r_hole, center=true, $fn=100);
    
    translate([4*r_hole, y-4*r_hole,0])
    cylinder(h=4*z, r1 = r_hole, center=true, $fn=100);

    translate([x-4*r_hole, y-4*r_hole,0])
    cylinder(h=4*z, r1 = r_hole, center=true, $fn=100); 
        
    translate([x-4*r_hole, 4*r_hole,0])
    cylinder(h=4*z, r1 = r_hole, center=true, $fn=100); 
    }
    
    translate([(x+1)*i, (y+1)*j, 0])
    rotate([0,0,270])
    translate([-y+6, x-3, -2]) {linear_extrude(height = 6){text(datetext, font = "Liberation Sans:style=Bold Italic", size=1.25);}}
 

    
    }


// call the module to build each panel 
    
// variables are i, j, sunrise, solar_noon, sunset
//build_panel(0, 1, 8, 12, 16);
//build_panel(1, 1, 9, 13, 14);
    
    
// add values scraped from NOAA

// 2023 Jan 1
build_panel(0, 1, 7.1, 11.88861111111111, 16.7, "2023 Jan 1"); 

// 2023 Aug 1
build_panel(0, 2, 4.883333333333333, 11.945, 19.0, "2023 Aug 1"); 

// 2023 Mar 2
build_panel(0, 3, 6.35, 12.043611111111112, 17.733333333333334, "2023 Mar 2"); 

// 2023 Oct 2
build_panel(0, 4, 5.766666666666667, 11.66638888888889, 17.55, "2023 Oct 2"); 

// 2023 May 3
build_panel(0, 5, 4.883333333333333, 11.787777777777778, 18.7, "2023 May 3"); 

// 2023 Dec 3
build_panel(0, 6, 6.8, 11.660833333333334, 16.516666666666666, "2023 Dec 3"); 

// 2023 Jul 4
build_panel(0, 7, 4.55, 11.908888888888889, 19.266666666666666, "2023 Jul 4"); 

// 2023 Feb 5
build_panel(1, 0, 6.85, 12.069722222222222, 17.3, "2023 Feb 5"); 

// 2023 Sep 5
build_panel(1, 1, 5.383333333333334, 11.8225, 18.25, "2023 Sep 5"); 

// 2023 Apr 6
build_panel(1, 2, 5.483333333333333, 11.883055555555556, 18.28333333333333, "2023 Apr 6"); 

// 2023 Nov 6
build_panel(1, 3, 6.333333333333333, 11.563611111111111, 16.783333333333335, "2023 Nov 6"); 

// 2023 Jun 7
build_panel(1, 4, 4.483333333333333, 11.816111111111113, 19.166666666666668, "2023 Jun 7"); 

// 2023 Jan 8
build_panel(1, 5, 7.1, 11.941666666666666, 16.8, "2023 Jan 8"); 

// 2023 Aug 8
build_panel(1, 6, 4.983333333333333, 11.934722222222222, 18.866666666666667, "2023 Aug 8"); 

// 2023 Mar 9
build_panel(1, 7, 6.183333333333334, 12.0175, 17.85, "2023 Mar 9"); 

// 2023 Oct 9
build_panel(2, 0, 5.866666666666667, 11.630833333333332, 17.366666666666667, "2023 Oct 9"); 

// 2023 May 10
build_panel(2, 1, 4.766666666666667, 11.77888888888889, 18.8, "2023 May 10"); 

// 2023 Dec 10
build_panel(2, 2, 6.9, 11.709444444444443, 16.516666666666666, "2023 Dec 10"); 

// 2023 Jul 11
build_panel(2, 3, 4.616666666666667, 11.927777777777775, 19.23333333333333, "2023 Jul 11"); 

// 2023 Feb 12
build_panel(2, 4, 6.733333333333333, 12.075, 17.416666666666668, "2023 Feb 12"); 

// 2023 Sep 12
build_panel(2, 5, 5.483333333333333, 11.78277777777778, 18.066666666666663, "2023 Sep 12"); 

// 2023 Apr 13
build_panel(2, 6, 5.316666666666666, 11.851111111111113, 18.383333333333333, "2023 Apr 13"); 

// 2023 Nov 13
build_panel(2, 7, 6.45, 11.572777777777777, 16.683333333333334, "2023 Nov 13"); 

// 2023 Jun 14
build_panel(3, 0, 4.466666666666667, 11.839166666666667, 19.216666666666665, "2023 Jun 14"); 

// 2023 Jan 15
build_panel(3, 1, 7.083333333333333, 11.988333333333332, 16.9, "2023 Jan 15"); 

// 2023 Aug 15
build_panel(3, 2, 5.083333333333333, 11.91638888888889, 18.73333333333333, "2023 Aug 15"); 

// 2023 Mar 16
build_panel(3, 3, 6.016666666666667, 11.986388888888888, 17.966666666666665, "2023 Mar 16"); 

// 2023 Oct 16
build_panel(3, 4, 5.983333333333333, 11.600833333333332, 17.2, "2023 Oct 16"); 

// 2023 May 17
build_panel(3, 5, 4.65, 11.777500000000002, 18.9, "2023 May 17"); 

// 2023 Dec 17
build_panel(3, 6, 6.983333333333333, 11.764166666666666, 16.55, "2023 Dec 17"); 

// 2023 Jul 18
build_panel(3, 7, 4.7, 11.940833333333334, 19.183333333333334, "2023 Jul 18"); 

// 2023 Feb 19
build_panel(4, 0, 6.6, 12.07, 17.55, "2023 Feb 19"); 

// 2023 Sep 19
build_panel(4, 1, 5.583333333333333, 11.741388888888888, 17.883333333333333, "2023 Sep 19"); 

// 2023 Apr 20
build_panel(4, 2, 5.15, 11.823611111111113, 18.5, "2023 Apr 20"); 

// 2023 Nov 20
build_panel(4, 3, 6.583333333333333, 11.593333333333334, 16.6, "2023 Nov 20"); 

// 2023 Jun 21
build_panel(4, 4, 4.466666666666667, 11.864166666666666, 19.25, "2023 Jun 21"); 

// 2023 Jan 22
build_panel(4, 5, 7.033333333333333, 12.025833333333336, 17.033333333333335, "2023 Jan 22"); 

// 2023 Aug 22
build_panel(4, 6, 5.183333333333334, 11.890833333333331, 18.58333333333333, "2023 Aug 22"); 

// 2023 Mar 23
build_panel(4, 7, 5.833333333333333, 11.9525, 18.066666666666663, "2023 Mar 23"); 

// 2023 Oct 23
build_panel(5, 0, 6.1, 11.578888888888889, 17.05, "2023 Oct 23"); 

// 2023 May 24
build_panel(5, 1, 4.566666666666666, 11.783888888888889, 19.0, "2023 May 24"); 

// 2023 Dec 24
build_panel(5, 2, 7.05, 11.821666666666667, 16.6, "2023 Dec 24"); 

// 2023 Jul 25
build_panel(5, 3, 4.783333333333333, 11.946944444444444, 19.1, "2023 Jul 25"); 

// 2023 Feb 26
build_panel(5, 4, 6.45, 12.055555555555555, 17.666666666666668, "2023 Feb 26"); 

// 2023 Sep 26
build_panel(5, 5, 5.683333333333334, 11.7, 17.7, "2023 Sep 26"); 

// 2023 Apr 27
build_panel(5, 6, 5.0, 11.801388888888887, 18.6, "2023 Apr 27"); 

// 2023 Nov 27
build_panel(5, 7, 6.7, 11.62527777777778, 16.55, "2023 Nov 27"); 

// 2023 Jun 28
build_panel(6, 0, 4.5, 11.889166666666666, 19.266666666666666, "2023 Jun 28"); 

// 2023 Jan 29
build_panel(6, 1, 6.95, 12.053333333333336, 17.166666666666668, "2023 Jan 29"); 

// 2023 Sep 29
build_panel(6, 2, 5.716666666666667, 11.683055555555557, 17.633333333333333, "2023 Sep 29"); 

// 2023 May 30
build_panel(6, 3, 4.516666666666667, 11.79472222222222, 19.08333333333333, "2023 May 30"); 

// 2023 Dec 30
build_panel(6, 4, 7.083333333333333, 11.870833333333334, 16.666666666666668, "2023 Dec 30"); 

// 2023 Dec 31
build_panel(6, 5, 7.083333333333333, 11.87888888888889, 16.683333333333334, "2023 Dec 31"); 
