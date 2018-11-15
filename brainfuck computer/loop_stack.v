module loop_stack(
    input               push, pop,
    input       [9:0]   address_in,
    output  reg [9:0]   address_out
);

reg [9:0]  stack[31:0];
reg [4:0]   stack_pointer = 5'b0_0000;

always @(*)
begin
  if(push & !pop)
  begin
    stack[stack_pointer[4:0]] = address_in;
    stack_pointer[4:0] = stack_pointer[4:0] + 5'b0_0001;
  end
  else if(!push & pop)
  begin
    stack[stack_pointer[4:0]][9:0] = 10'b00_0000_0000;
    stack_pointer[4:0] = stack_pointer[4:0] - 5'b0_0001;
    address_out = stack[stack_pointer[4:0]];
  end
end
endmodule