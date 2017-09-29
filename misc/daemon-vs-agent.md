<link rel='stylesheet' href='../shared/style.css'>

<a href='../index.html'>Return to homepage.</a>

# Daemons

A **daemon** is a program that runs in the background as part of the overall
system (that is, it is not tied to a particular user). A daemon cannot diplay
any GUI; more specifically, it is not allowed to connect to the window server.
A web server is an example of a daemon.

# Agents

An **agent** is a process that runs in the background on behalf of a particular
user. Agents are useful because they can do things that daemons can't, like
reliably access the user's home directory or connect to the window server.
