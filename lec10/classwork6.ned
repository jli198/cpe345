simple Node3
{
  parameters:
    @display("i=block/routing");  // add default icon
    int num_msgs = 10;
  gates:
    input in;
    output out;
}

network Classwork
{
  @display("bgb=342,184");
  submodules:
    node1: Node3 {
    paramaters:
    @display("i=,cyan;p=38,69");  // do not change icon (first arg of i=) just colorize it
}
  node2: Node3 {
    parameters:
    @display("i=,gold;p=154,69"); // here too
  }
  node3: Node3 {
    parameters:
    @display("i=,red;p=154,143"); // here too
  }
  connections:
    node1.out --> node2.in;
    node2.out --> node3.in;
    node3.out --> node1.in;