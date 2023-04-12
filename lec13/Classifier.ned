simple Classifier
{
  parameters:
    @group(Queueing);
    @display("i=block/classifier")
    string dispatchField @enum("type","priority") = default("type");
    gates:
      input in[];
      output out[];
    output rest;  // messages that were not classified
}