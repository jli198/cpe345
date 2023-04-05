//
//  Network
//
network Network
{ 
  types:  // Defines type of channel
    channel C extends ned.DatarateChannel { // Basic channel type
      datarate = 100 Mbps;
    }
  submodules:
    node1: Node;  // Node type - needs to be declared
    node2: Node;
    node3: Node;
    ...
  connections:  // Connections will have properties specified for type C channel
    node1.port++ <--> C <--> node2.port++;
    node2.port++ <--> C <--> node4.port++;
    node4.port++ <--> C <--> node6.port++;
    ... // Bidirectional gates Bidirectional connections
}