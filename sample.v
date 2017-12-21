module sample (
input clk,
input clr,  //Active high clear
input r,
input up, //Active high up count enable
input dn, //Active down up count enable
output reg [1:0] count
);

always @(posedge clk) begin
       if(clr == 1) begin
           count <= 'b0;
       end
	   else
	   if(r == 1)
	   count<= 2'b10;
	   else 
	   begin
           if(up == 1) 
		   begin
                 count <= count + 1;
           end 
		   else 
		   if(dn == 1) 
		   begin
				 if(count == 2'b00)
				 count <= count - 2;
				 else
				 count <= count - 1;
           end
       end
end
endmodule