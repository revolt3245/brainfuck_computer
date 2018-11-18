module Program_counter(
    input               enable, clk, branch,
    input       [9:0]   B_ADR,
    output  reg [9:0]   ADR = 10'h000
);
always @(posedge clk)
begin
  if(enable)
  begin
    if(branch)
    begin
      ADR[9:0] <= B_ADR[9:0];
    end
    else
    begin
      ADR[9:0] <= ADR[9:0] + 10'h001;
    end
  end
end
endmodule