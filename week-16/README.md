## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:
  
**Karl Fitzgerald is the Chairman and CEO of Altoro Mutual**
- How can this information be helpful to an attacker:

**This information can be useful because an attacker can target the CEO with phishing or whaling attempts.**

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  1. Where is the company located: 
    **Sunnyvale, CA 94085**
  2. What is the NetRange IP address:
    **65.61.137.64-65.61.137.127**
  3. What is the company they use to store their infrastructure:
    
**CustName:       Rackspace Backbone Engineering
Address:        9725 Datapoint Drive, Suite 100
City:           San Antonio
StateProv:      TX
PostalCode:     78229
Country:        US
RegDate:        2015-06-08
Updated:        2015-06-08
Ref:            https://rdap.arin.net/registry/entity/C05762718**

  4. What is the IP address of the DNS server:
   **65.61.137.117**
#### Step 3: Shodan

- What open ports and running services did Shodan find:
  **https://www.shodan.io/host/65.61.137.117
Open Ports: 80, 443, 8080**
#### Step 4: Recon-ng

- Install the Recon module `xssed`. 
- Set the source to `demo.testfire.net`. 
- Run the module. 

Is Altoro Mutual vulnerable to XSS: 
 **Yes, 1 total (1 new) vulneratbilities found.**
### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:

- Command for Zenmap to run a service scan against the Metasploitable machine: 

 **In Kali VM Command line:**
   1) Type: zenmap
   2) press enter
   3) zenmap pops up and in target window type:192.168.0.10 
      (it is the Metasploitable VM IP address)
   4) Profile: click drop down to Quick scan
   5) click scan
- Bonus command to output results into a new text file named `zenmapscan.txt`:
- 
  **In Zenmap screen:**
    1) In upper left corner click scan 
    2) click save scan
    3) Select File Type: Nmap test format (.nmap)
    4) File name: zenmapscan.txt

- Zenmap vulnerability script command: 

- Once you have identified this vulnerability, answer the following questions for your client:
  1. What is the vulnerability:
     **Zenmap found the following vulnerability:**

      https://github.com/D7Carivs/Trilogy-Bootcamp-Homework/blob/main/week-16/enum%20screenshots/smb-enum-shares-1.PNG

      https://github.com/D7Carivs/Trilogy-Bootcamp-Homework/blob/main/week-16/enum%20screenshots/smb-enum-shares.PNG


  2. Why is it dangerous:
  
     - It is dangerous because it leaves the opportunity open for malicious actor to send bytes on port 21 to open a backdoor on port 6200 and run as root. 
  1. What mitigation strategies can you recommendations for the client to protect their server:
  
     -A patch would be a mitigation strategy to eliminate the vulnerability to the open backdoor attack. 

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  

