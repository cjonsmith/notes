<link rel="stylesheet" href="../shared/style.css"/>

# Introduction

## What is NoSQL?

The standard model for databases is known as *relational databases*.

Cassandra is what is known as a *NoSQL* database, also known as a *non-relational database*.

*"Many of the online applications that are used today have data requirements that exceed the cabailities
of legacy relational databases. The need for very low latency, heretofore unknown levels of scale,
continuous uptime, global distribution of data, the ability to both write and read anywhere, and
reducing both software and operational costs, all have given birth to the non-relational database
model."*

## Tradeoffs
Non-relational databases use new and potentially unfamiliar architectures and data models. There are
often trades-offs as dictated by the [CAP theorem](https://en.wikipedia.org/wiki/CAP_theorem) that must be 
made in order to obtain the necessary benefits that non-relational databases need.

|**Relational Database**|**Cassandra**|
|-----------------------|-------------|
|Handles moderate incoming data|Handles high incoming data velocity|
|Data arriving from one/few locations|Data arriving form many locations|
|Manages primarily structured data|Manages all types of data|
|Supports complex/nested transactions|Supports simple transactions|
|Single point of failure with failover|No single points of failure; constant uptime|
|Supports moderate data volumes|Supports very high data volumes|
|Centralized deployments|Decentralized deployments|
|Data written in mostly one location|Data written in many locations|
|Supports read scaliability (with consistency sacrfices)|Supports read and write scalability|
|Deployed in vertical scale up fashion|Deployed in horizontal scale out fashion|

**Vertical Scale-Up:** Scale up by adding more power (CPU, RAM)<br/>
**Horizontal Scale-Up:** Scale up by adding more machines

# What is Apache Cassandra?

*"Apache Cassandra is a massively scalable open source non-relational database that offers continuous availability,
linear scale performance, operational simplicity and easy data distribution across multiple data centers and 
cloud availability zones. Cassandra was originally developed at Facebook, was open sourced in 2008, and became a 
top-level Apache project in 2010."*

## Key Cassandra Features and Benefits

-	Massively scalable architecture
-	Active everywhere design
-	Linear scale performance
-	Continuous availability
-	Transparent fault detection and recovery
-	Flexible and dynamic data model
-	Strong data protection
-	Tunable data consistency
-	Multi-data center replication
-	Data compression
-	CQL (Cassandra Query Language)

## Top Use Cases

-	IoT applications
-	Product catalogs and retail apps
-	User activity tracking and monitoring
-	Messaging
-	Social media analytics and recommendation engines
-	Other time-series-based applications

# Architecture Overview

[SO post about hierarchy of elements in Cassandra](https://goo.gl/rb232x)

Cassandra has a masterless [*"ring"*][ring] architecture, where all nodes play an identical role; there is
no concept of a master node, with all nodes communicating with each other via a distributed, scalable
protocol called [*"gossip"*][gossip].

The design goal of Cassandra is to handle big data workloads across multiple nodes without any single
point of failure. Cassandra has a [peer-to-peer][ptp] distributed system across its nodes, and data is distributed
among all nodes in a [cluster][cluster].

Unlike other master-slave or shared systems, Cassandra has no single point of failure and therefore is
capable of offering true continuous availability and uptime.

## Writing and Reading Data

Data is written to Cassandra in a way that provides both full data durability and high performance.
Data is first written to a Cassandra node in an on-disk commit log and then written to a memory-based
structure called a *memtable*. When a memtable's size exceeds a specified threshold, the data is
written to an immutable file on disk called an *SSTable* (Sorted String Table). The operation of
writing the data to a SSTable is called *flushing*.

<!-- Glossary -->
[ptp]: http://searchnetworking.techtarget.com/definition/peer-to-peer
[cluster]: https://insidehpc.com/2006/03/what-is-a-cluster/
[gossip]: https://en.wikipedia.org/wiki/Gossip_protocol
[ring]: https://academy.datastax.com/sites/default/files/cassandra-ring_0.png
