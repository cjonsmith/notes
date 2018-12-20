<link rel='stylesheet' href='../shared/style.css'>

<a href='../index.html'>Return to homepage.</a>

# Xfconf

__xfconf__ is a tree-like configuration storage system for xfce.

## Tree Structure

In the xfconf tree, each node is a _setting_ that corresponds to an xfce UI element, and there are three types of nodes in the hierarchy: 

> 1.    [root](#Root)
> 2.    [channel](#Channel)
> 3.    [property](#Property)

All _immediate children_ of the __root__ are known as __channels__, and all settings (nodes) beneath a __channel__ are called __properties__.

### Root

The top-level xfce desktop manager.

### Channel

A channel is an application-defined domain for storing configuration settings. [1](http://hackage.haskell.org/package/xfconf-4.8.0.0/docs/System-XFCE-Xfconf-Channel.html) Channels represent applications, which can have multiple [properties](#Property).

### Property

A specific setting for an application (channel).

