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
    stack[stack_pointer] = address_in;
    stack_pointer = stack_pointer + 5'b0_0001;
  end
  else if(!push & pop)
  begin
    stack_pointer = stack_pointer - 5'b0_0001;
    address_out = stack[stack_pointer];
  end
end
endmodule