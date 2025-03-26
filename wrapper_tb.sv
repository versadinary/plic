`timescale 1ns / 100ps
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
               // outputs
               .CA(CA),
               .CB(CB),
               .CC(CC),
               .CD(CD),
               .CE(CE),
               .CF(CF),
               .CG(CG)
               );

   /*initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
   end*/

   initial begin
      BTND <= 1;
      #10;
      BTND <= 0;
//      for (int i = 0; i < 16; i++) begin
//         #20;
//         BTNC <= 1;
//         #400;
//         BTNC <= 0;
//         #60;
//        // #;
      //end
      #20;
      BTNC <= 1;
      #3000;
      BTNC <= 0;
      #3000;
      BTND <= 1;    
      #2000;
      BTND <= 0;
      for (int i = 0; i < 8; i++) begin
         #20;
         BTNC <= 1;
         #400;
         BTNC <= 0;
         #60;
        // #;
      end
      BTND <= 1;
      #1250;
      BTND <= 0;
      #1250;
      for (int i = 0; i < 8; i++) begin
         #20;
         BTNC <= 1;
         #400;
         BTNC <= 0;
         #60;
        // #;
      end
      //repeat (500) @(posedge CLK100MHZ);
      //$finish;
   end


   
   always begin
      CLK100MHZ <= 1;
      #10;
      CLK100MHZ <= 0;
      #10;
   end
endmodule
