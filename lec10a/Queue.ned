simple Queue  // Defines type Queue of module
{ 
  parameters: // Specifies class implementation
    int capacity;
    @class(mylib::Queue);
    @display("i=block/queue");  // Customizes look
  gates:
    input in;
    output out;
}