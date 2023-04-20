import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network My_MM1
{
    @display("bgb=312,209");
    submodules:
        source: Source {
            @display("p=39,83");
        }
        queue: Queue {
            @display("p=135,85");
        }
        sink: Sink {
            @display("p=228,88");
        }
    connections:
        source.out --> queue.in++;
        queue.out --> sink.in++;
}