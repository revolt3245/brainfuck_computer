module Register_Pointer(
    input               enable, increment, decrement,
    output  reg [9:0]   R_ADR = 10'h000
);

always @(posedge increment or posedge decrement)
begin
  if(enable)
  begin
    if(increment & !decrement)
    begin
      R_ADR[9:0] <= R_ADR[9:0] + 10'h001;
    end
    else if(!increment & decrement)
    begin
      R_ADR[9:0] <= R_ADR[9:0] - 10'h001;
    end
  end
end
endmodule