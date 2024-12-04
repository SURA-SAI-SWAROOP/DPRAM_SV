class driver;
transaction tr;
mailbox #(transaction) gen2drv;
virtual mem_if vif;
function new (mailbox #(transaction) gen2drv);
this.gen2drv=gen2drv;
endfunction
task reset();
vif.reset=1'b1;
vif.we=1'b0;
vif.re=1'be;
vif.wr_addr=6'b000000;
vif.rd_addr<=6'b000000;
vif.data in<=8'b0000 0000;
repeat (5) @(posedge vif.clk);
vif.reset<=0;
$display("[DRV]:: RESET IS DONE");
$display("-- .");
endtask
task write();
@(posedge vif.clk);
vif.reset<=1'b0;
vif.wetr.we;
vif.retr.re;
vif.wr addr=tr.wr addr;
vif.data_in<=tr.data_in;
@(posedge vif.clk);
vif.we<=1'b0;
vif.re=1'b0;
$display("[DRV]::we=%0d\t re=%0d\t wr_addr=%0d\t data_in=%0d", vif.we, vif.re, vif.wr_addr, vif.data_in);
@(posedge vif.clk);
endtask

  task read();
@(posedge vif.clk);
vif.reset<=1'b0;
vif.wetr.we;
vif.retr.re;
vif.rd_addr=tr.rd_addr;
@(posedge vif.clk);
vif.we<=1'b0;
vif.re=1'b0;
$display("[DRV]:: Data read from rd_addr=%0d", vif.rd_addr);
@(posedge vif.clk);
endtask
task main();
forever begin
gen2drv.get(tr);
if (tr.we || tr.re) begin
fork
if(tr.we==1'b1) begin
write();
end
if(tr.re==1'b1) begin
read();
end
join
end
else begin
$display("[DRV]:: NO WRITE OR READ OPERATION");
end
end
endtask
endclass
