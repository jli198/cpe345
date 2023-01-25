#include <iostream>
using namespace std;

int service_time(void) {
  int r;
  r = rand()/RAND_MAX;
  if (r<.1) return (1);
  else if (r<.3) return (2);
    else if (r<.6) return(3);
      else if (r<.85) return(4);
        else if (r<.95) return(5);
          else return(6);
}