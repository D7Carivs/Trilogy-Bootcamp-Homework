## Unit 19 Homework: Protecting VSI from Future Attacks

### Scenario

In the previous class,  you set up your SOC and monitored attacks from JobeCorp. Now, you will need to design mitigation strategies to protect VSI from future attacks. 

You are tasked with using your findings from the Master of SOC activity to answer questions about mitigation strategies.

### System Requirements 

You will be using the Splunk app located in the Ubuntu VM.

### Logs

Use the same log files you used during the Master of SOC activity:

- [Windows Logs](resources/windows_server_logs.csv)
- [Windows Attack Logs](resources/windows_server_attack_logs.csv)
- [Apache Webserver Logs](resources/apache_logs.txt	)
- [Apache Webserver Attack Logs](resources/apache_attack_logs.txt	)

---

### Part 1: Windows Server Attack

Note: This is a public-facing windows server that VSI employees access.
 
#### Question 1
- Several users were impacted during the attack on March 25th.
- Based on the attack signatures, what mitigations would you recommend to protect each user account? Provide global mitigations that the whole company can use and individual mitigations that are specific to each user.
 
- **Global Mitigation: The global mitigation I suggest is to enact multifactor authentication throughout the entire system. It would greatly inhibit the success of bad actors accessing user accounts**

- **Individual User Mitigation:**<br>
  **User_K: I would recommend limiting the number of password changes in a given time and the number of attempts to change a password. Their password was attempted to be changed several times.**<br>
  **User_A: I would enforce password requirements with length and special characters along with the global mitigation of multifactor authentication. This would greatly inhibit the brute force attack that was happening.**<br>
  **User_J: I would recommend changing the password immediately and utilizing the same protocol as with User_A. The attacker was able to successfully log on to User_J account.**  
  
#### Question 2
- VSI has insider information that JobeCorp attempted to target users by sending "Bad Logins" to lock out every user.
- What sort of mitigation could you use to protect against this?

**A policy could be set to unlock locked accounts in a certain holding period and require password reset linked to a separate account or recovery device preset in the policy.**<br>
**To mitigate against this type of DOS, the threshold could be slightly raised.**
 
  

### Part 2: Apache Webserver Attack:

#### Question 1
- Based on the geographic map, recommend a firewall rule that the networking team should implement.
- Provide a "plain english" description of the rule.
  - For example: "Block all incoming HTTP traffic where the source IP comes from the city of Los Angeles."
- Provide a screen shot of the geographic map that justifies why you created this rule.
 
**Most of the incoming traffic was coming from Ukraine. A firewall rule could be set up to block HTTP traffic from Ukraine.**<br>
**Description of the rule would be: "Block all incoming HTTP traffic where the source IP address comes from Ukraine."**<br>

**2 screenshots** 
  
#### Question 2

- VSI has insider information that JobeCorp will launch the same webserver attack but use a different IP each time in order to avoid being stopped by the rule you just created.

- What other rules can you create to protect VSI from attacks against your webserver?
  - Conceive of two more rules in "plain english". 
  - Hint: Look for other fields that indicate the attacker.
   
    **I would suggest creating rules based off useragent and byte size. Both were the same in all events. '200 65748 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 2.0.50727987787; InfoPath.1)"'**<br>
    **Rule Descriptions:**<br>
    **1) Block all incoming HTTP traffic where "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 2.0.50727987787; InfoPath.1)".**<br>
    **2) Block all incoming HTTP traffic where the byte amount is equal to 65748.**

  


### Guidelines for your Submission:
  
In a word document, provide the following:
- Answers for all questions.
- Screenshots where indicated

Submit your findings in BootCampSpot!

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
