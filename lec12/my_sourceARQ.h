#ifndef __MY_ARQ2_MY_SOURCEARQ_H_
#define __MY_ARQ2_MY_SOURCEARQ_H_

#include <omnetpp.h>

using namespace omnetpp;

/**
 * TODO - Generated class
 */
class My_sourceARQ : public cSimpleModule
{
  private:
    simtime_t timeout;
    cMessage *timeoutEvent;
    cPacket *pkt;
    int counter;
    int limit;

  public:
    My_sourceARQ();
    virtual ~My_sourceARQ();

  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
};

#endif