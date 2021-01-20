module modAdd();

        reg in, x, y;
        wire out, z;

        retAdd myadd(out, z, in, x, y);

        initial
                begin
                $dumpfile("test.vcd");
                $dumpvars;

        in = 1;
        x = 0;
        y = 1;

        #3
                x = 1;
                y = 0;
        #3
                y = 1;
        #3
                in=0;
        #5
                $finish;
end
endmodule
