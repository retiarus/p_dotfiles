#/sbin/brctl addbr br0

tunctl -u peregrinus
tunctl -u peregrinus
tunctl -u peregrinus

#ip addr flush dev enp3s0

/sbin/brctl addif br0 tap1
/sbin/brctl addif br0 tap2
/sbin/brctl addif br0 tap3
#/sbin/brctl addif br0 enp3s0

