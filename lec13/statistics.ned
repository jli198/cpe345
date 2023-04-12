packet.org.omnetpp.queueing;
// Destroys (or optionally keep) packets and collect statistics
simple Sink
{
	parameters:
		@Group(Queueing);
		@display("i=block/sink")
		@signal[lifeTime](type="simtime_t");
		@signal[totalQueueingTime](type="simtime_t");
		@signal[totalDelayTime](type="simtime_t");
		@signal[totalServiceTime](type="simtime_t");
		@signal[queuesVisited](type="int");
		@signal[delaysVisited](type="int");
		@signal[generation](type="int");
		@statistic[lifeTime](title="lifetime of arrived jobs";unit=s;record=vector,mean,max;interpolationmode=none);
		@statistic[totalQueueingTime](title="the total time spent in queues by arrived jobs";unit=s;record=vector?,mean,max;interpolationmode=none);
		@statistic[totalDelayTime](title="the total time spent in delay nodes by arrived jobs";unit=s;record=vector?,mean,max;interpolationmode=none);
		@statistic[totalServiceTime](title="the total time spent by arrived jobs";unit=s;record=vector?,mean,max;interpolationmode=none);
		@statistic[queuesVisited](title="the total number of queues visited by arrived jobs";record=vector?,mean,max;interpolationmode=none);
		@statistic[delaysVisited](title="the total number of delays visited by arrived jobs";record=vector?,mean,max;interpolationmode=none);
		@statistic[generation](title="the generation of the arrived jobs";record=vector?,mean,max;interpolationmode=none);
		bool keepJobs = default(false); // whether to keep received jobs till end of simulation
		gates:
			input in[];
}