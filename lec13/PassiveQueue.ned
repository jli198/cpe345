simple PassiveQueue
{
  parameters:
    @group(Queueing);
    @signal[dropped](type="long");
		@signal[queueLength](type="long");
		@signal[queueingTime](type="simtime_t");
		@signal[dropped](title="drop event";record=vector?,count;interpolationmode=none);
		@statistic[queueLength](title="queue length";record=vector,timeavg,max;interpolationmode=sample-hold);
		@statistic[queueingTime](title="queueing time at dequeue";record=vector?,mean,max;unit=s;interpolationmode=none);
		@display("i=block/passiveq;q=queue");

    int capacity = default(-1); // negative capacity means unlimited queue
    bool fifo = default(true);  // whether module works as queue (fifo=true) or stack (fifo=false)
    string SendingAlgorithm @enum("priority","random","roundRobin","minDelay") = default("priority"); // how queue tries to find suitable server for incoming job
    
    gates:
      input in[];
      output out[];
}