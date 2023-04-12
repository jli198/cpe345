simple Server
{
  parameters:
    @group(Queueing);
    @display("i=block/server");
    @signal[busy](type="bool");
    @statistic[busy](type="server busy state";record=vector?,timeavg;interpolationmode=sample-hold);

    string fetchingAlgorithm @enum("priority","random","roundRobin","longestQueue")=default("priority");  // how next job will be chosen from attached queues
    volatile double serviceTime @unit(s); // service time of job
    gates:
      input in[];
      output out[];
}