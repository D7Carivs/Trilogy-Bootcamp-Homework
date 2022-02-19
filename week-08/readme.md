_Phase 1_


**Determined the IP ranges to scan were as follows:**        

**12.205.151.0 to 12.205.151.255**                           

**15.199.151.0 to 15.199.151.255**                           

**15.199.158.80 to 15.199.158.95**                           

**15.199.141.80 to 15.199.141.95**                           

**15.199.131.80 to 15.199.131.95**                           

**15.199.121.80 to 15.199.121.95**                           

**15.199.111.80 to 15.199.111.95**                           

**15.199.100.80 to 15.199.100.95**                           

**15.199.99.80 to 15.199.99.95**                             

**15.199.98.80 to 15.199.98.95**                             

**15.199.97.80 to 15.199.97.95**                             

**15.199.96.80 to 15.199.96.95**                             

**15.199.95.80 to 15.199.95.95**                             

**15.199.94.80 to 15.199.94.95**                             

**11.199.121.80 to 11.199.121.95**                           

**11.199.158.80 to 11.199.158.95**                           

**167.172.144.11**                                           

**11.199.141.80 to 11.199.141.95**                           

**11.199.131.80 to 11.199.131.95**                           

**11.199.121.80 to 11.199.121.95**                           

**11.199.111.80 to 11.199.111.95**                           

**11.199.100.91**                                            

**11.199.99.0 to 11.199.99.255**                             

**11.199.98.80 to 11.199.98.95**                             

 **The following command was used to run fping:**

 **fping -s -g 12.205.151.0 12.205.151.255**

 **fping -s -g 15.199.151.0 15.199.151.255**

 **fping -s -g 15.199.158.80 15.199.158.95**

 **fping -s -g 15.199.141.80 15.199.141.95**

 **fping -s -g 15.199.131.80 15.199.131.95**

 **fping -s -g 15.199.121.80 15.199.121.95**

 **fping -s -g 15.199.111.80 15.199.111.95**

 **fping -s -g 15.199.100.80 15.199.100.95**

 **fping -s -g 15.199.99.80 15.199.99.95**

 **fping -s -g 15.199.98.80 15.199.98.95**

 **fping -s -g 15.199.97.80 15.199.97.95**

 **fping -s -g 15.199.96.80 15.199.96.95**

 **fping -s -g 15.199.95.80 15.199.95.95**

 **fping -s -g 15.199.94.80 15.199.94.95**

 **fping -s -g 11.199.121.80 11.199.121.95**

 **fping -s -g 11.199.158.80 11.199.158.95**

 **fping -s 167.172.144.11**

 **fping -s -g 11.199.141.80 11.199.141.95**

 **fping -s -g 11.199.131.80 11.199.131.95**

 **fping -s -g 11.199.121.80 11.199.121.95**

 **fping -s -g 11.199.111.80 11.199.111.95**

 **fping -s 11.199.100.91**

 **fping -s -g 11.199.99.0 11.199.99.255**

 **fping -s -g 11.199.98.80 11.199.98.95**


**Results:**

**167.172.144.11 is alive**

**12.205.151.1 is alive**

**All others are unreachable**

**Summary:**
**It was determined that there is a potential vulnerability: IP 167.172.144.11 and 12.205.151.1 are responding.**
**Since RockStar Corp does not want to respond to any requests, this is a vulnerability.**
**Recommend to restrict allowing ICMP echo requests against IP 167.172.144.11 and 12.205.151.1 to prevent successful**
**responses from PING requests**
**These occurances happened on the network layer as PING uses IP addresses and IPs are used on the Network Layer.**

_Phase 2_

**Commands:**

**sudo nmap -sS 167.172.144.11**

**sudo nmap -sS 12.205.151.1**

**Results:**

**22/tcp open ssh**

**The nmap scan showed all other ports are filtered.**

**Summary:**

**After enumerating the IP address obtained in the last phase, it is seen that port 22/tcp ssh is open**
**These scans were done on OSI layer 4, the Transport Layer.**

_Phase 3_

**Commands:**

**sudo ssh jimi@167.172.144.11 -p 22**

**cat /etc/hosts**

**exit**

**nslookup 98.137.246.8**

**Results:**

**etc/hosts IP address for rollingstone.com 98.137.246.8**

**8.246.137.98.in-addr.arpa name = unknown.yahoo.com**

**Summary:**

**After utilizing nslookup and online DNS lookup tools, it was determined the IP address listed in /etc/hosts for rollingstone.com was changed to another domain. This was found on the OSI Network layer.**

_Phase 4_

**Commands:**

**sudo ssh jimi@167.172.144.11 -p 22**

**find -type f | grep packet**

**cat /etc/packetcaptureinfo.txt**

**Results:**
**Captured packets are here:**
**https://drive.google.com/file/d/1ic-CFFGrbruloYrWaw3PvT71elTkh3eF/view?usp=sharing**

**Summary: After analyzing the date in wireshark and looking at ARP, 192.168.47.200 points to two different MAC Addresses. This is the result of a hacker redirecting network traffic or leaving a backdoor to RockStar Corps server in the /etc/hosts configuration. The hacker made posts offering sensitive information for payment. RockStar Corp should create static ARP entry in the server reduce the risk of ARP Poisoning. They should also modify the firewall to disallow unauthorized traffic on port 22. This ARP attack was done on the OSI Network Layer.**
