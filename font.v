`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:23 08/21/2016 
// Design Name: 
// Module Name:    font 
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
module font(
input [2:0] character_select,
input [3:0] rom_addr,
input [2:0] rom_col,
output rom_bit
    );
//Número de fila seleccionado por rom_addr
reg [7:0] rom_data;
//Números asignados a cada caractér
localparam d_addr = 3'd1;
localparam o_addr = 3'd2;
localparam c_addr = 3'd3;
localparam n_addr = 3'd4;
localparam j_addr = 3'd5;
localparam cero_addr = 3'd0;

//rom_bit 1 o 0 según el bit seleccionado del font
assign rom_bit = rom_data [rom_col];
always@*
begin

//Letra D
if(character_select==cero_addr)
	begin
		case (rom_addr)
  
4'h0: rom_data = 8'b00000000;
  
4'h1: rom_data = 8'b00000000;
  
4'h2: rom_data = 8'b00000000;
  
4'h3: rom_data = 8'b00000000;
  
4'h4: rom_data = 8'b00000000;
  
4'h5: rom_data = 8'b00000000;
 
4'h6: rom_data = 8'b00000000;
 
4'h7: rom_data = 8'b00000000;
  
4'h8: rom_data = 8'b00000000;
  
4'h9: rom_data = 8'b00000000; 
 
4'hA: rom_data = 8'b00000000;
 
4'hB: rom_data = 8'b00000000;
 
4'hC: rom_data = 8'b00000000;
 
4'hD: rom_data = 8'b00000000;
4'hE: rom_data = 8'b00000000;

4'hF: rom_data = 8'b00000000;
	
endcase
end

else

//Letra D
if(character_select==d_addr)
	begin
		case (rom_addr)
  
4'h0: rom_data = 8'b00000000;
  
4'h1: rom_data = 8'b11111000;
 
4'h2: rom_data = 8'b01101100;
  
4'h3: rom_data = 8'b01100110;
  
4'h4: rom_data = 8'b01100110;
  
4'h5: rom_data = 8'b01100110;
  
4'h6: rom_data = 8'b01100110;
  
4'h7: rom_data = 8'b01100110;
  
4'h8: rom_data = 8'b01100110;
  
4'h9: rom_data = 8'b01100110; 
 
4'hA: rom_data = 8'b01100110;
 
4'hB: rom_data = 8'b01100110;
 
4'hC: rom_data = 8'b01100110;
 
4'hD: rom_data = 8'b01101100;
4'hE: rom_data = 8'b11111000;
4'hF: rom_data = 8'b00000000;
	
endcase
end
else

//Letra C
if(character_select==c_addr)
begin
case (rom_addr)
  
4'h0: rom_data = 8'b00000000;

  4'h1: rom_data = 8'b00111100;
  
4'h2: rom_data = 8'b01100110;
  
4'h3: rom_data = 8'b11000010;
  
4'h4: rom_data = 8'b11000000;
  
4'h5: rom_data = 8'b11000000;
  
4'h6: rom_data = 8'b11000000;
  
4'h7: rom_data = 8'b11000000;
  
4'h8: rom_data = 8'b11000000;
  
4'h9: rom_data = 8'b11000000; 
 
4'hA: rom_data = 8'b11000000;
 
4'hB: rom_data = 8'b11000000;
 
4'hC: rom_data = 8'b11000010;
  
4'hD: rom_data = 8'b01100110;
4'hE: rom_data = 8'b00111100;
 
4'hF: rom_data = 8'b00000000;

endcase
end
else


//Letra N
if(character_select==n_addr)
	begin
	case (rom_addr)
 
 4'h0: rom_data = 8'b00000000;
  
4'h1: rom_data = 8'b11000110;
  
4'h2: rom_data = 8'b11100110;
  
4'h3: rom_data = 8'b11110110;
  
4'h4: rom_data = 8'b11111110;
  
4'h5: rom_data = 8'b11111110;
  
4'h6: rom_data = 8'b11011110;
  
4'h7: rom_data = 8'b11001110;
  
4'h8: rom_data = 8'b11000110;
  
4'h9: rom_data = 8'b11000110; 
 
4'hA: rom_data = 8'b11000110;
 
4'hB: rom_data = 8'b11000110;
 
4'hC: rom_data = 8'b11000110;
 
4'hD: rom_data = 8'b11000110;
4'hE: rom_data = 8'b11000110;

4'hF: rom_data = 8'b00000000;
	
endcase
end
	
//Letra J
else
if(character_select == j_addr)
begin
case (rom_addr)
 
4'h0: rom_data = 8'b00000000;

4'h1: rom_data = 8'b00011110;
  
4'h2: rom_data = 8'b00001100;
  
4'h3: rom_data = 8'b00001100;
  
4'h4: rom_data = 8'b00001100;
  
4'h5: rom_data = 8'b00001100;
  
4'h6: rom_data = 8'b00001100;
  
4'h7: rom_data = 8'b00001100;
  
4'h8: rom_data = 8'b00001100;
  
4'h9: rom_data = 8'b00001100; 
  
4'hA: rom_data = 8'b00001100;
  
4'hB: rom_data = 8'b11001100;
  
4'hC: rom_data = 8'b11001100;
  
4'hD: rom_data = 8'b11001100;
4'hE: rom_data = 8'b01111000;
  
4'hF: rom_data = 8'b00000000;

endcase
end 


//Letra O
else
if(character_select == o_addr)
begin
case (rom_addr)
  
4'h0: rom_data = 8'b00000000;
  
4'h1: rom_data = 8'b01111100;
  
4'h2: rom_data = 8'b11000110;
  
4'h3: rom_data = 8'b11000110;
  
4'h4: rom_data = 8'b11000110;
  
4'h5: rom_data = 8'b11000110;
  
4'h6: rom_data = 8'b11000110;
  
4'h7: rom_data = 8'b11000110;
  
4'h8: rom_data = 8'b11000110;
  
4'h9: rom_data = 8'b11000110; 
  
4'hA: rom_data = 8'b11000110;
  
4'hB: rom_data = 8'b11000110;
  
4'hC: rom_data = 8'b11000110;
  
4'hD: rom_data = 8'b11000110;
4'hE: rom_data = 8'b01111100;
  
4'hF: rom_data = 8'b00000000;

endcase
end
else 
rom_data = 8'b00000000;
end

endmodule
