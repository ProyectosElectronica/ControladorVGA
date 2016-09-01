`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:03:51 08/20/2016 
// Design Name: 	
// Module Name:    RGB 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RGB (
input R, G, B,
input [10:0] pix_x, 
input [10:0] pix_y,
input rom_bit,
output wire vga_R, vga_G, vga_B,
output [3:0]rom_addr, 
output [2:0]rom_col,
output reg [2:0] character_select
);

reg red, green, blue;
//rom_addr = fila del font, rom_col = columna del font
//wire  rom_addr ;
//wire  rom_col ;

//Pixeles donde se va ubicar la imagen

localparam puntoinicialx=800;
localparam puntoinicialy=480;
localparam puntofinaly=544;

reg Y;

always@(pix_y)
begin
if((puntoinicialy <= pix_y) && (pix_y <= puntofinaly))
begin
Y<=1'b1;
referenciay <= puntoinicialy;
end
else
begin
Y<=1'b0;
referenciay <= pix_y;
end
end


//Variables para recorrer las filas y columnas del font
reg [10:0] referenciay;
reg [10:0] referenciax;
reg display;


//Case para seleccionar el caracter según la posición en x, el número depende del módulo font
//solo se habilita con la zona delimitada en y
always@(pix_x, Y)
begin
if(Y==1'b1)
begin
//Casos aumentan cada 32 bits porque el scaling es 4x, inicia en la posición 768.
casex (pix_x)
  10'b11000xxxxx: begin character_select = 3'd4; referenciax = puntoinicialx; end
  10'b11001xxxxx: begin character_select = 3'd5; referenciax = puntoinicialx+32; end
  10'b11010xxxxx: begin character_select = 3'd3; referenciax = puntoinicialx+64; end
  10'b11011xxxxx: begin character_select = 3'd1; referenciax = puntoinicialx+96; end
  10'b11100xxxxx: begin character_select = 3'd2; referenciax = puntoinicialx+128; end
  10'b11101xxxxx: begin character_select = 3'd3; referenciax = puntoinicialx+160; end
  default: begin character_select = 3'd0; referenciax = pix_x; end
endcase
end
else
begin
character_select = 3'd0; referenciax = pix_x;
end
end

//Definición del área de display en resolución 1280x1024.

always@(pix_x,pix_y)
begin
if(pix_x>=359 && pix_x<=1639 && pix_y>=40 && pix_y<=1064)
display<=1'b1;
else
display<=1'b0;
end

//Always que envía el color solo cuando la imagen lo necesita
always@(R, G, B,rom_bit, display)
begin
	if(rom_bit == 1'b1 && display == 1'b1)
		begin
		red <= R;
		green <= G;
		blue <= B;
 		end
	else 
		begin
		red <= 1'b0;
		green <= 1'b0;
		blue <= 1'b0;
		end

end



// Define el número de la fila, inicial en 0 hasta 15

assign rom_addr = pix_y [5:2] -  referenciay [5:2]  ;

//Define la columna de los 8 bits de la imagen, inicia en 7 hasta 0
assign rom_col = referenciax [4:2] - pix_x [4:2];

//Salidas de color para los pines del VGA
assign vga_R = red;
assign vga_G = green;
assign vga_B = blue;

endmodule

