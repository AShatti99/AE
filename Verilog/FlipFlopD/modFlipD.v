module modFlipD();

        reg clock, d;
        wire q, notq;

        retFlipD myFlipD(q, notq, clock, d);

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

        #2
                d=1;
        #2
                d=0;
        #2
                d=1;
        #2
                $finish;
end
endmodule
