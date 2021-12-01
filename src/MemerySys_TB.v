
module MemerySys_TB;

parameter DATA_WIDTH = 32;

reg clk_tb = 0;
reg white_Enable_i_tb, sel_tb;
reg [(DATA_WIDTH-1):0] Address_i_tb, Write_Data_tb;
wire[(DATA_WIDTH-1):0] ReadData;


 MemorySys_wrap #(

	.MEMORY_DEPTH(64),
	.DATA_WIDTH (32)

)
MEMut
(

	.white_Enable_i_w(white_Enable_i_tb),
	.clk_w(clk_tb),
	.sel_w(sel_tb),
	.Address_i_w(Address_i_tb),
	.Write_Data_w(Write_Data_tb),
	.Instruction_o_w(ReadData)

);

initial 
	begin 
		forever #2 clk_tb = !clk_tb;
	end
	


initial begin

	#0 Address_i_tb = 32'h10010000;
	#0 Write_Data_tb <= 32'hFFFFFFFF;
	#0 white_Enable_i_tb = 1;
	#0 sel_tb = 1;
	#100 Address_i_tb = 32'h10010008;
	#1  Write_Data_tb <= 32'h12345678;
	#100 Address_i_tb = 32'h1001000c;
	#1  Write_Data_tb <= 32'h98761234;
	#100 Address_i_tb = 32'h10010010;
	#1  Write_Data_tb <= 32'hA0A0A0A0;
	#100 Address_i_tb = 32'h10010014;
	#1  Write_Data_tb <= 32'hABCDEF12; 
	
	#100 sel_tb = 0;
	#100 Address_i_tb <= 32'h400000;
	#100 Address_i_tb <= 32'h400004;
	#100 Address_i_tb <= 32'h400008;
	#100 Address_i_tb <= 32'h40000c;
	#100 Address_i_tb <= 32'h400010;
	#100 Address_i_tb <= 32'h400014;
	#100 Address_i_tb <= 32'h400018;
	#100 Address_i_tb <= 32'h40001c;
	
end

endmodule 





	