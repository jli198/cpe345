simple SourceOnce
{
  parameters:
    @group(Queueing);
    @display("i=block/source");
    @signal[created](type="long");
    int numJobs = default(1); // number of jobs to generate
    double time @unit(s) = default(0s); // when to generate
    string jobName = default("job");  // base name of generated job (will be module name if left empty)
    voltatile int jobType = default(0); // type attribute of created job (used by classifiers and other modules)
    voltatile int jobPriority = default(0); // priority of job
    gates:
      output out;
}