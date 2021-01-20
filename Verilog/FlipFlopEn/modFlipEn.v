module modFlipEn();

        reg clock, d, en;
        wire q, notq;

        retFlipEn myFlipEn(q, notq, clock, d, en);

        always
                begin
                #1 clock = ~clock;
        end

        initial
                begin
                $dumpfile("test.vcd");
                $dumpvars;

        clock = 0;
        d=1;
        en=1;

        #2
                d=0;
        #2
                d=1;
        #2
                en=0;
        #2
                d=0;
        #2
                $finish;
end
endmodule
