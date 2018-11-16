module Instruction_memory(
    input       [3:0]   inst_in,
    input               RW,
    input       [9:0]   ADR,
    output  reg [3:0]   inst_out
);

reg [3:0]   register[1023:0];

always @(posedge RW or negedge RW)
begin
  if(RW)
  begin
    inst_out[3:0] <= register[ADR[9:0]][3:0];
  end
  else
  begin
    register[ADR[9:0]][3:0] <= inst_in[3:0];
  end
end
endmodule