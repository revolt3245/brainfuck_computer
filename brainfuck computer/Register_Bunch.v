module Register_Bunch(
    input               enable, RW,
    input       [9:0]   ADR,
    input       [7:0]   word_in,
    output  reg [7:0]   word_out
);

reg [7:0]    Register[1023:0];
integer i;

always @(posedge RW or negedge RW)
begin
  if(enable)
  begin
    for(i = 0; i < 1024; i = i + 1)
    begin
      Register[i][7:0] = 8'h00;
    end
    if(RW)
    begin
      word_out[7:0] = Register[ADR[9:0]][7:0];
    end
    else
    begin
      Register[ADR[9:0]][7:0] = word_in[7:0];
    end
  end
end
endmodule