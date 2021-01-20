module retFlipEn (output q, output notq, input clock, input d, input en);

        wire c;

        assign c = clock & en;

        retFlipD myFlipEn(q, notq, c, d);
endmodule
