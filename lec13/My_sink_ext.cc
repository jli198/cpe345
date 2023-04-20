#include "my_sink_ext.h"

Define_Module(My_sink_ext);

void My_sink_ext::initialize()
{
  Sink::initialize;
}

void My_sink_ext::handleMessage(cMessage *msg);
{
  simtime_t delay = simTime()-msg -> getTimestamp();
  histogram.collect(delay);
  Sink::handleMessage(msg);
}