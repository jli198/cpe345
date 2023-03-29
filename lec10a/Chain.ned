# Compoound module

module Chain
  parameters:
    int count;
  submodules:
    node[count] : Node {
      gates:
        port[2];
    }
  connections allowunconnected:
    for i = 0..count-2 {
      node[i].port[1] <--> node[i+1].port[0];
    }