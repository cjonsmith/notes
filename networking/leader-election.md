<link rel='stylesheet' href='../shared/style.css'>

# Leader Election

In distributed computing, *leader election* is the process of designating
a single process as the organizer of some task distributed among several
computers (nodes).

All nodes start either unaware of which node will server as the "leader" of the
task, or will be unable to communicate to the current leader. After a leader
election algorithm has been run, however, each node thoughout the network
recognizes a particular, unique node as the task leader.

The network of nodes decide among themselves which node will be the leader.

## Algorithms

<!-- Quick links -->
[wikipedia]: https://en.wikipedia.org/wiki/Leader_election
