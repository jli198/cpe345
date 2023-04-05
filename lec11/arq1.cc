#include <stdio.h>
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;


class Source : public cSimpleModule
{
  private:
   simtime_t timeout;
   cMessage *timeoutEvent;

  public:
    Source();
    virtual ~Source();

  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Source);

Source::Source(){
    timeoutEvent = nullptr;
}

Source::~Source(){
    cancelAndDelete(timeoutEvent);
}

void Source::initialize()
{
    timeout = 1.0;
    timeoutEvent = new cMessage("timeoutEvent");
    EV<<"Initial message sent";
    cMessage *msg = new cMessage("packet");
    send(msg, "out");
    scheduleAt(simTime()+timeout, timeoutEvent);
}

void Source::handleMessage(cMessage *msg){
    if (msg== timeoutEvent){
        EV<<"timer expired";
        cMessage *msg = new cMessage("packet");
        send(msg, "out");
        scheduleAt(simTime()+timeout, timeoutEvent);

    }
    else {
        EV<<"received ACK";
        cancelEvent(timeoutEvent);
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

void Destination::handleMessage (cMessage *msg){
    double probability = par("prob");
    if ( uniform(0,1) < probability){
        EV<<"message lost \n";
        delete msg;
    }
    else{
            EV<<"sending back as ACK \n";
          send(msg, "out");
        }
}