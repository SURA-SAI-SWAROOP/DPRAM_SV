class transaction;
rand bit [7:0] data_in;
rand bit [5:0] wr_addr;
rand bit [5:0] rd_addr;
rand bit we;
rand bit re;
bit [7:0] data_out;
constraint read{rd_addr inside {[0:5]};}
constraint write(wr_addr inside {[0:5]};}
function transaction copy();
copy=new();
copy.data_in=this.data_in;
copy.wr_addr=this.wr_addr;
copy.rd_addr=this.rd_addr;
copy.we=this.we;
copy.re=this.re;
copy.data_out=this.data_out;
endfunction
endclass
