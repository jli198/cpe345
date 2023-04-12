package my_queue_example;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Sink;

network Queueing_network
{
  submodules:
    gen: Source;
    fifo: Queue;
    sink: Sink;
  
  connections:
  gen.out --> fifo.in++;
  fifo.out --> sink.in++;
}