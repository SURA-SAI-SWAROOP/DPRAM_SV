`include "transaction.sv"
`include "generator.sv"
include "driver.sv"
`include "monitor.sv"
include "scoreboard.sv"
class environment;
generator gen;
driver drv;
monitor mon;
scoreboard sco;
mailbox #(transaction) gen2drv;
mailbox #(transaction) mon2scb;
event sconxt;
virtual mem_if vif;
function new (virtual mem_if vif);
gen2drv=new();
mon2scb=new();
gen=new (gen2drv);
drv=new(gen2drv);
mon=new(mon2scb);
sco=new(mon2scb);
this.vif=vif;
drv.vif=this.vif;
mon.vif=this.vif;
gen.sconxt=sconxt;
sco.sconxt=sconxt;
endfunction
