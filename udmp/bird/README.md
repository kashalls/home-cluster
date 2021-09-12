# Generic BGP with Bird on UDMP

1. Run `unifi-os shell`
2. Run `apt install bird`
3. Use this config:

```sh
# Change this into your BIRD router ID. It's a world-wide unique identification
# of your router, usually one of router's IPv4 addresses.
router id 10.0.0.1;

# The Device protocol is not a real routing protocol. It doesn't generate any
# routes and it only serves as a module for getting information about network
# interfaces from the kernel.
protocol device {
}

# The Kernel protocol is not a real routing protocol. Instead of communicating
# with other routers in the network, it performs synchronization of BIRD's
# routing tables with the OS kernel.
protocol kernel {
        metric 64;      # Use explicit kernel route metric to avoid collisions
                        # with non-BIRD routes in the kernel routing table
        import all;
        export all;     # Actually insert routes into the kernel routing table
}
# For each master + worker make a protocol pointing to that host using your asn.
protocol bgp {
        neighbor 10.20.30.3 as 64535;
        local 10.0.0.1 as 64535;
        direct;
}

protocol bgp {
        neighbor 10.20.30.4 as 64535;
        local 10.0.0.1 as 64535;
        direct;
}
```

1. Run `birdc configure`
2. Check for bgp with `birdc` then `show protocol`
