module dpram(
  input clk, reset,
  input [7:0] data_in,
  input [5:0] wr_addr, rd_addr,
  input we, re,
  output reg [7:0] data_out
);
  
  reg [7:0] mem [63:0];
  integer i;
  
  always@(posedge clk) begin
    if (reset) begin
      for(i=0;i<=63; i++) begin
        mem[i]<=8'b0000_0000;
      end 
    end
      
    else begin
      if (we) begin
        mem [wr_addr]<=data_in;
      end
        
      if (re) begin
        data_out<=mem[rd_addr];
      end
      
    end
    
  end
    
endmodule
