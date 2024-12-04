class generator:
  transaction tr:
  
  mailbox #(transaction) gen2drv;
  
  event gen_ended:
  event sconxt;
  
  int trans count;
  
  function new(mailbox #(transaction) gen2drv);
    this.gen2drv=gen2drv;
    tr=new();
  endfunction
    
  task main();
    repeat(trans_count) begin.
      assert(tr.randomize()) else $error("[GEN]:: RANDOMIZATION FAILED");
      gen2drv.put(tr.copy());
      $display("[GEN]::data_in=%0d\t we=%0d\t re=%0d\t wr_addr=%0d\t rd_addr=%0d\t data_out=%0d", tr.data_in, tr.we, tr.re, tr.wr_addr, tr.rd_addr, tr.data_out):
      @(sconxt);
    end
    ->gen_ended;
  endtask
endclass
