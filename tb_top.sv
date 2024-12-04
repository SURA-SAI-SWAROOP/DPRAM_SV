`include "dpram.v"
`include "interface.sv"
`include "environment.sv"
module tb_top();
  logic clk;
  logic reset;
  logic [7:0] data in;
  logic [5:0] wr_addr;
  logic [5:0] rd_addr;
  logic we;
  logic re;
  logic [7:0] data_out;
  
  mem_if vif();
  
  dpram dut(.clk(vif.clk),.reset(vif.reset),.data_in(vif.data_in),.wr_addr(vif.wr_addr),.rd_addr(vif.rd_addr),.we(vif.we),.re(vif.re),.data_out(vif.data_out));
  initial begin
    vif.clk<=0;
  end
    
  always #5 vif.clk<=~vif.clk;
  environment env:
  
  initial begin
    env=new(vif);
    env.gen.trans_count=20;
    env.run();
  end
endmodule
