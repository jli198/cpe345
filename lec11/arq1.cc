#include <stdio.h>
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;


class Source : public cSimpleModule
{
  private:
   simtime_t timeout; // timeout for source
   cMessage *timeoutEvent;  // holds pointer to timeout self-message

  public:
    Source();
    virtual ~Source();

  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Source);

Source::Source()
{
  timeoutEvent = nullptr;
}

Source::~Source(){
  cancelAndDelete(timeoutEvent);
}

void Source::initialize()
{
  timeout = 1.0;  //will initialize timeout to 1.0
  timeoutEvent = new cMessage("timeoutEvent");  //schedule first timeout event for first packet
  
  // Generate and send initial message
  EV << "Sending initial message\n";
  cMessage *msg = new cMessage("packet");
  send(msg, "out");
  scheduleAt(simTime()+timeout, timeoutEvent);
}

void Source::handleMessage(cMessage *msg)
{
  if (msg== timeoutEvent){
    // If receive timeout event, no ACK was received in time and timer expired - need to resend
    EV << "Timeout expired, resending message and restarting timer\n";
    cMessage *msg = new cMessage("packet");
    send(msg, "out");
    scheduleAt(simTime()+timeout, timeoutEvent);

  }
  else {  // ACK received
          // delete received message and cancel timeout event
    EV<<"received ACK";
    cancelEvent(timeoutEvent);
    delete msg;

    // Send another packet
    cMessage *msg = new cMessage("packet");
    send(msg, "out");
    scheduleAt(simTime()+timeout, timeoutEvent);
  }
}

class Destination : public cSimpleModule
{
  protected:
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Destination);

void Destination::handleMessage (cMessage *msg)
{
  if (uniform(0,1) < .1) { // lose message with probability .1 - will implement this later differently
    EV << "Message lost \n";
    bubble("message lost"); // use animation
    delete msg;
  }
  else {
    EV<<"sending back as ACK \n";
    send(msg, "out");
  }
}