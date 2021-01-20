module retFlipD(output q, output notq, input clock, input d);

        wire n;
        wire dummy;
        wire notclock;

        assign notclock = ~clock;

        retD master(n, dummy, notclock, d);
        retD slave(q, notq, clock, n);
endmodule
