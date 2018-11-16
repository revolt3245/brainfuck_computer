module Upload_pointer(
    input               enable, increment, decrement,
    output  reg [9:0]   ADR = 10'h000;
);

always@(posedge increment or posedge decrement)
begin
  if(enable)
  begin
    if(increment & !decrement)
    begin
      ADR[9:0] <= ADR[9:0] + 10'h001;
    end
    else if(!decrement & increment)
    begin
      ADR[9:0] <= ADR[9:0] - 10'h001;
    end
    else
    begin
      ADR[9:0] <= ADR[9:0];
    end
  end
end
endmodule