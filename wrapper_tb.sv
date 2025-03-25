`timescale 1ns / 1ps
module wrapper_tb();
   logic CLK100MHZ;

   logic BTNC;
   logic BTND;

   logic CA;
   logic CB;
   logic CC;
   logic CD;
   logic CE;
   logic CF;
   logic CG;

   wrapper dut(
               .CLK100MHZ(CLK100MHZ),
               .BTNC(BTNC),
               .BTND(BTND),
               .CA(CA),
               .CB(CB),
               .CC(CC),
               .CD(CD),
               .CE(CE),
               .CF(CF),
               .CG(CG)
               );

   initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
   end

   initial begin
      #20;
      BTNC <= 1;
      #500;
      BTNC <= 0;
      #30;
   end


   
   always begin
      CLK100MHZ <= 1;
      #10;
      CLK100MHZ <= 0;
      #10;
   end
endmodule
