simple Source
{
    parameters:
        @display("i=block/source");
    gates:
        input in;
        output out;
}

simple Destination
{
    parameters:
        @display("i=block/sink");
        double prob = default(0.1);
    gates:
        input in;
        output out;
}

network MyARQ1
{
    submodules:
        source: Source {
        	@display("p=40, 42");    
        }
        destination: Destination {
            @display("p=142,42");
        }
    connections:
        source.out --> destination.in;
        destination.out --> source.in;

}