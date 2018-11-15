`timescale 1ns/1ns

module tb_loop_stack;

reg     [11:0]  opcode;
wire    [9:0]   address_out;
/*
opcode
    [11] - push
    [10] - pop
    [9:0] - address_in
*/

loop_stack  lst(.push(opcode[11]), .pop(opcode[10]),
                .address_in(opcode[9:0]), .address_out(address_out));

initial
begin
        opcode[11:0] = 12'b1101_0010_1100;
  #10   opcode[11:0] = 12'b1000_0110_1110;
  #10   opcode[11:0] = 12'b0100_0011_0000;
end
endmodule