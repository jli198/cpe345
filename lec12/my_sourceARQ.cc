#include "my_sourceARQ.h"

Define_Module(My_sourceARQ);

My_sourceARQ::My_sourceARQ() {
  timeoutEvent = nullptr;
}

My_sourceARQ::~My_sourceARQ() {
  cancelAndDelete(timeoutEvent);
}

void My_sourceARQ::initialize()
{
  timeout = 1.0;
  counter = 0;
  limit = par("limit");
  timeoutEvent = new cMessage("timeoutEvent");
  EV<<"Sending initial message\n";
  pkt = new cPacket("packet");
  pkt -> setBitLength(10);
  send(pkt->dup(), "out");
  scheduleAt(simTime()+timeout, timeoutEvent);
}

void My_sourceARQ::handleMessage(cMessage *msg)
{
  if (msg ==timeoutEvent){
    EV<<"Timeout expired";
    send(pkt->dup(), "out");
    scheduleAt(simTime()+timeout, timeoutEvent);
  }
  else{
    counter++;
    EV<< "Received ACK. Timeout cancelled. \n";
    cancelEvent(timeoutEvent);
    delete msg;
    if (counter < limit){
      pkt = new cPacket("packet");
      pkt -> setBitLength(10);
      send(pkt->dup(), "out");
      scheduleAt(simTime()+timeout, timeoutEvent);
    }
    else {
      delete(pkt);
    }
  }
}