simple Router
{
  parameters:
    @group(Queueing);
    @display("i=block/routing");
    string routingAlgorithm @enum("random","roundRobin","shortestQueue","minDelay") = default("random");
    volatilte int randomGateIndex = default(int uniform (0, sizeof(out)-1));  // destination gate in case of random routing
    gates:
      input in[];
      output out[];
}