#include "Sink.h"

class My_sink_ext : public queueing::Sink
{
  protected:
    cHistogram histogram;
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
};

#endif