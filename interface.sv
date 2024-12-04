interface mem_if;
  logic clk;
  logic reset;
  logic [7:0] data_in;
  logic [5:0] wr_addr;
  logic [5:0] rd_addr;
  logic we;
  logic re;
  logic [7:0] data_out;
endinterface
