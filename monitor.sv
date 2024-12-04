class monitor;
  transaction tr;
  
  mailbox #(transaction) mon2scb;
  
  virtual mem_if vif;
  
  function new (mailbox #(transaction) mon2scb);
    this.mon2scb=mon2scb;
  endfunction
    
  task main();
    tr=new();
    forever begin
      repeat(2) @(posedge vif.clk);
      tr.data_in=vif.data_in;
      tr.we=vif.we;
      tr.re=vif.re;
      tr.wr_addr=vif.wr_addr;
      tr.rd_addr=vif.rd_addr:
      @(posedge vif.clk);
      tr.data out=vif.data out;
      mon2sch.put(tr);
      $display("[MON]::data_in=%0d\t we=%0d\t re="%0d\t wr_addr=%0d\t rd_addr=%0d\t data_out=%0d", tr.data_in, tr.we,tr.re, tr.wr_addr,tr.rd_addr,tr.data_out);       
    end
  endtask
endclass
