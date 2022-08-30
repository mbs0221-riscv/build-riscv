var x1;
var x2;
var x3;
var x4;
var x5;
var e13;
var e14;
var e15;
var r13;
var r14;
var r15;
 
var y1 binary;
var y2 binary;
 
minimize z: y1 + y2;
 
s.t. con1 : -x1+ x3 + e13 + r13 = 327;
s.t. con2 : -x1+ x4 + e14 + r14 = 275; 
s.t. con3 : -x1+ x5 + e15 + r15 = 277;
s.t. con19 : e13 - 5 <= 0 ;
s.t. con20 : -e13 - 5 <= 0 ;
s.t. con21 : e14 - 5 <= 0 ;
s.t. con22 : -e14 - 5 <= 0 ;
s.t. con23 : e15 - 5 <= 0 ;
s.t. con24 : -e15 - 5 <= 0 ;
