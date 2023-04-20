import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network My_MM3
{
    @display("bgb=351,238");
    submodules:
        source: Source {
            @display("p=36,115");
        }
        passiveQueue: PassiveQueue {
            @display("p=164,115");
        }
        server1: Server {
            @display("p=270,35;b=47,45");
        }
        server2: Server {
            @display("p=271,104");
        }
        server3: Server {
            @display("p=271,176");
        }
        sink: Sink {
            @display("p=367,115");
        }
    connections:
        source.out --> passiveQueue.in++;
        passiveQueue.out++ --> server1.in++;
        passiveQueue.out++ --> server2.in++;
        passiveQueue.out++ --> server3.in++;
        server3.out --> sink.in++;
        server2.out --> sink.in++;
        server1.out --> sink.in++;
}