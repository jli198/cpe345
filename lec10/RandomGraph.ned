module RandomGraph {
  parameters:
    int count;
    double connectedness; // 0.0<x<1.0
  submodules:
    node[count]: Node {
      gates:
        in[count];
        out[count];
    }
  connections allowunconncted:  // Use this keyword to not get error for unconnected gates
    for i=0..count-1, for j=0..count-1 {
      node[i].out[j] --> node[j].in[i]
        if i!=j && uniform(0, 1)<connectedness;
    } // Conditional connections
}