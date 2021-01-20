module modD();

        reg clock, d;
        wire q, notq;

        retD myD (q, notq, clock, d);

        always
                begin
                #1 clock = ~clock; 
        end

        initial
                begin
                $dumpfile ("test.vcd");
                $dumpvars;

        clock = 0;
        d = 0;

        #3
                d=1;
        #3
                d=0;
        #3
                d=1;
        #3
                $finish;
end
endmodule
