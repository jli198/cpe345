#ifndef __MY_ARQ2_MY_DESTARQ_H_
#define __MY_ARQ2_MY_DESTARQ_H_

#include <omnetpp.h>

using namespace omnetpp;

/**
 * TODO - Generated class
 */
class My_DestARQ : public cSimpleModule
{
  private:
    cStdDev delay_stats;
    cHistogram hist;
  protected:
    virtual void handleMessage(cMessage *msg);
    virtual void finish() override;
};

#endif