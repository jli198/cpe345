//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

simple Source
{
    parameters:
        @display("i=block/source");
    gates:
        input in;
        output out;
}

simple Destination
{
    parameters:
        @display("i=block/sink");
        double prob;
    gates:
        input in;
        output out;
}

network ARQ1
{
    parameters:
      @display("bgb=217,159");
    submodules:
        source: Source;
        destination: Destination {
            @display("p=168,61");
        }
    connections:
        source.out --> destination.in;
        destination.out --> source.in;
}