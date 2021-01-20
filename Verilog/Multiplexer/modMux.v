module modMux();

        reg a, b, c;
        wire d;

        retMux myMux (d, a, b, c);

        initial
                begin
                $dumpfile("test.vcd");
                $dumpvars;
        a=0;
        b=0;
        c=0;

        # 3
                a=0;
                c=0;
        # 3
                c=1;
        # 3
                a=1;
                b=0;
        # 3
                b=1;
        # 1
                $finish;
end
endmodule
