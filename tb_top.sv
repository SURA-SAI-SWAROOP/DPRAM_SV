"include "dpram.v"
include "interface.sv"
include "environment.sv"
module th top();
logic clk:
logic reset:
logic (7:0] data in;
logic [5:8] wr_addr;
logic [5:8] rd_addr;
logic we;
logic re:
logic (7:8) data_out;
mem if vif();
dpram dut(.clk(vif.clk)..reset(vif.reset), data_in(vif.data_in), wr_addr(vif.wr_addr),.rd_addr(vif.rd_addr),.we (vif.we)..re(vif.re), data_out(vif.data_out));
initial begin
vif.clk;
end
always #5 vif.clk-vif.clk;
environment env:
initial begin
env=new(vif);
env.gen.trans_count=20;
env.run();
end
endmodule
