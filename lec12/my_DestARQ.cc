#include "my_DestARQ.h"

Define_Module(My_DestARQ);

void My_DestARQ::handleMessage(cMessage *msg)
{
  cPacket *pkt_received =check_and_cast<cPacket *> (msg);
  if (pkt_received -> hasBitError()) {
    EV<<"Message lost. \n";
    bubble("message lost");
    delete(pkt_received);
  }
  else
  {
    EV<<"Sending back same packet as ACK. \n";
    simtime_t delay = simTime()-pkt_received -> getCreationTime();
    delay_stats.collect(delay);
    hist.collect(delay);
    send(pkt_received, "out");
  }
}

void My_DestARQ::finish() {
  EV << "mean delay = " << delay_stats.getMean() << "\n";
  EV << "min delay = " << delay_stats.getMin() << "\n";
  EV << "max delay = " << delay_stats.getMax() << "\n";
  EV << "standard deviation = " << delay_stats.getStddev() << "\n";
  delay_stats.record();
  hist.record();
}