module retD(output q, output notq, input clock, input d);

        wire s, r;

        assign s = clock & d;
        assign r = clock & ~d;

        retSR sr(q, notq, s, r);
endmodule
