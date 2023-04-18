network My_ARQ2
{
    @display("bgb=284,187");
    submodules:
        destination: My_DestARQ {
            @display("p=205,106");
        }
        source: My_sourceARQ {
            @display("p=69,100");
        }
    connections:
        source.out --> {datarate = 10000 bps; ber = 0.01;} --> destination.in;
        destination.out --> {delay = 5 ms;} --> source.in;
}