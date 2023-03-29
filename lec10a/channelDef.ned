channel Ch1 extends ned.DatarateChannel
{
  datarate = 100Mbps;
  delay = 100us;
  ber = 1e-10;
  }

channel DatarateChannel2 extends ned.DatarateChannel
{
  double length @unit(m);
  delay = this.length / 200000km * 1s;
}

//  Example use:
//  tic.out -> DatarateChannel2{1 km} -> toc.out