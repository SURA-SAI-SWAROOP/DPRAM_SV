class monitor;
transaction tr:
mailbox #(transaction) mon2scb;
virtual mem if vif;
function new (mailbox (transaction) mon2scb);
this.mon2scb=mon2scb;
endfunction
task main();
tr=new();
forever begin
repeat(2) @(posedge vif.clk);
tr.data_in=vif.data_in;
tr.we vif.we;
tr.re vif.re;
tr.wr_addr=vif.wr addr;
tr.rd addr=vif.rd addr:
@(posedge vif.clk);
tr.data out vif.data out;
mon2sch.put(tr);
Edisplay("[MON]::data_in=%@d\t we=%8d\t re="%@d\t wr_addr=\@d\t rd_addr=%@d\t data_out=%0d", tr.data_in, tr.we,tr.re, tr.wr_addr,tr.rd_addr,tr.data_out);
end
endtask
endclass
