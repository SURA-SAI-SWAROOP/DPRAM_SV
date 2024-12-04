class scoreboard;
transaction tr:
mailbox #(transaction) mon2scb;
event sconxt:
bit [7:8] mem[63:0];
function new(mailbox #(transaction) mon2scb);
this.mon2scb=mon2scb;
endfunction
task main();
forever begin
mon2scb.get(tr);
$display("[SCO]::data_in=\0d\t we=%0d\t re=%8d\t wr_addr=%8d\t rd_addr=%0d\t data_out=%0d",tr.data_in.tr.we.tr.re, tr.wr_addr.tr.rd_addr,tr.data_out):
if(tr.we=1'b1) begin
mem/tr.wr_addr=tr.data_in:
end
if(tr.re==1'hl) begin
if(mem[tr.rd_addr tr.data_out) begin
$display("[SCB-PASS]:: Expected=%ed and Actual=%d", mem[tr.rd_addr), tr.data_out);
end
else begin
Serror("[SCB-FAIL]:: Expected sod and Actual %0d",mem[tr.rd addr), tr.data_out);
end
end
display(
-"):
->sconxt:
end
endtask
endclass
