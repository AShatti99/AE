module modSR();

        reg s, r;
        wire q, notq;

        retSR mySR(q, notq, s, r);

        initial
                begin
                $dumpfile("test.vcd");
                $dumpvars;
        s=0;
        r=0;

        #3
                r=1;
        #3
                s=1;
                r=0;
        #3      
                r=1;
        #3
                s=0;
        #3
                r=0;
        #3
                $finish;
end
endmodule
