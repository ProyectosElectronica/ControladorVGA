module hvsync_generator(clk, rst, vga_h_sync, vga_v_sync, CounterX, CounterY);

input clk;
input rst;

output vga_h_sync, vga_v_sync;

output [10:0] CounterX;

output [10:0] CounterY;


//////////////////////////////////////////////////


reg [10:0] CounterX;
reg [10:0] CounterY;

//Valores m�ximos para resoluci�n 1280x1024

wire CounterXmaxed = (CounterX==11'd1687);
wire CounterYmaxed = (CounterY==11'd1065);

localparam [10:0] Hsync = 11'd111;
localparam [10:0] Vsync = 11'd2;
localparam [10:0] YBack = 11'd40;
localparam [10:0] Yfront = 11'd1064;
localparam [10:0] HBack = 11'd359;
localparam [10:0] Hfront = 11'd1639;
 
//Contadores para X y Y.


always @(posedge clk)
begin


if(CounterXmaxed==1'b1 || rst ==1'b1)

CounterX <= 0;


else
	
CounterX <= CounterX + 11'd1;


end


always @(posedge clk)
begin


if(CounterXmaxed==1'b1) 
CounterY <= CounterY + 11'd1;

else begin

if(rst==1'b1 || CounterYmaxed==1'b1) 
CounterY<=11'd0;
end


end

//Definici�n de las se�ales de sincronizaci�n del VGA

reg vga_HS, vga_VS;


always @(CounterX, CounterY)

begin

vga_HS <= !(CounterX[10:0]>Hsync); 

vga_VS <= !(CounterY[10:0]>Vsync); 

end


//Para resoluci�n 1280x1024 los pulsos deben ser positivos. En 640x480 deber�an ser negativos. 
	


assign vga_h_sync = vga_HS;

assign vga_v_sync = vga_VS;

endmodule

