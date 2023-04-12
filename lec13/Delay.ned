simple delay
{
  parameters:
    @group("Queueing");
    @signal[delayedJobs](type="long");
    @statistic[delayedJobs](title="number of delayed jobs"; record=vector?,timeavg,max; interpolationmode=sample-hold);
    @display("i=block/delay");
    volatile double delay @unit(s); // requested delay time (can be distribution)
    gates:
      input in[]; // incoming message gates
      output out; // outgoing message gate
}