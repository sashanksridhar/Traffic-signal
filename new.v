module countertb1;
integer i;
reg [1:0]din;
reg clk,reset,clk1;
output [1:0]dout;
reg [1:0]din1;
reg reset1;
output [1:0]dout1;
reg up,down,up1,down1;
sample s(clk,reset,0,up,down,dout);
//bitdec my(clk,reset,din,dout);
decoder mydec(dout[1],dout[0],y0,y1,y2);
sample s1(clk1,0,reset1,up1,down1,dout1);
//bitcounter my1(clk1,reset1,din1,dout1);

decoder1 mydec1(dout1[1],dout1[0],y01,y11,y21);
initial begin
reset = 1;
up = 1;
down = 0;
clk = 0;
//#2 din  = 2;
reset1  = 1;
up1 = 0;
down1= 1;
 
 //dout1 <= 2'b10;
// din1  = 0;//#1
clk1 = 0;
end
always #2 clk = ~clk;
always #2 clk1 = ~clk1;
initial
begin
#1 $monitor (" R ",y0," Y ",y1," G ",y2,"|","R ",y01," Y ",y11," G ",y21);
#4;
for(i=0;i<10;i = i+1)
begin
reset = 0;

reset1 = 0;
#2;
if(dout1 == 2'b00)
begin
up1 = 1;
down1 = 0;
end
if(dout1 == 2'b10)
begin
up1 = 0;
down1 = 1;
end
//din1 = dout1;
//#2;
//din = dout;
if(dout == 2'b10)
begin
up = 0;
down = 1;
end
if(dout == 2'b00)
begin
up = 1;
down = 0;
end
end
$finish;
end
endmodule