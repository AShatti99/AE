module retAdd(output rout, output s, input rin, input a, input b);

        assign rout = (~rin & a & b)  |
                      (rin & ~a & b)  |
                      (rin & a & ~b)  |         // si puo' semplificare
                      (rin & a & b);


        assign s = (~rin & ~a & b) |
                   (~rin & a & ~b) |
                   (rin & ~a & ~b) |
                   (rin & a & b);
endmodule
