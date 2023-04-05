network Network
{
  types:
  channel C extends ned.DatarateChannel {
  datarate = 100Mbps;
  }
  channel C1 extends ned.DatarateChannel{
  ber = 0.01;
  }
  submodules:
  node1: Node;
  node2: Node;
  node3: Node;
  ...
  connections:
  node1.port++ <--> C1 <--> node2.port++;
  node2.port++ <--> {delay = 10ms; datarate=100Mbps;} <--> node4.port++;
  ...
}