class generator:
transaction tr:
mailbox (transaction) gen2drv;
event gen ended:
event sconxt:
int trans count;
function new(mailbox #(transaction) gen2drv);
this.gen2drv=gen2drv;
tr=new();
endfunction
task main();
repeat(trans_count) begin.
assert(tr.randomize()) else $error("[GEN]:: RANDOMIZATION FAILED");
gen2drv.put(tr.copy());
display("[GEN]::data_in=%8d\t we=%@d\t re=s8d\t wr_addr=%@d\t rd_addr=s@d\t data_out="ed", tr.data_in, tr.we, tr.re, tr.wr_addr, tr.rd_addr, tr.data_out):
$ @(sconxt);
end
->gen_ended;
endtask
Endclass
