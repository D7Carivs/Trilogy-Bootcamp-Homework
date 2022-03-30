## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/D7Carivs/Trilogy-Bootcamp-Homework/blob/main/Project%201/ELK%20Stack%20Topology.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - We created an ansible playbook to automate the ELK install so to not have to manually install it on the server. To use the playbook, log into the Jump Box and issue: ansible-playbook install_elk.yml. It will run the install_elk.yml on the elk host.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers protect your private network and allow availability by distributing traffic evenly accross a network. A JumpBox creates an advantage by creating a secure connection for authorized individuals to access the private network to launch administrative tasks for example. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat can monitor log files or locations to collect data and events sending them to a Logstash or Elasticsearch for further investigation. 
- Metricbeat sends metrics and stats to a logstash or Elasticsearch much like filebeat does. 

The configuration details of each machine may be found below.

| Name     | Function  | IP Address | Operating System |
|----------|---------- |------------|------------------|
| Jump Box | Gateway   | 10.0.0.4   | Linux            |
| DVWA 1   | Web Server| 10.0.0.9   | Linux            |
| DVWA 2   | Web Server| 10.0.0.10  | Linux            |
| DVWA 3   | Web Server| 10.0.0.11  | Linux            |
| Elk      | Monitoring| 10.1.0.4   | Linux            |     

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My personal IP address or one that you would specify

Machines within the network can only be accessed by SSH.
- The only machine allowed to access the Elk machine(10.1.0.4) is JumpBox Server from private IP (10.0.0.4)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | Personal IP Address  |
| DVWA 1   | No                  | 10.1.0.4             |
| DVWA 2   | No                  | 10.1.0.4             |
| DVWA 3   | No                  | 10.1.0.4             |
| Elk      | No                  | 10.1.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Ansible playbook is a script file that contains all the tasks and commands located in on location to quickly deploy over and SSH connection and can be reused to save time and does not require personal manual entry for potentially multiple step and operations freeing up valuable time. 
The playbook implements the following tasks:
- Configure and install Elk docker
- Increse memory
- Install Pythonp3-pip

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/D7Carivs/Trilogy-Bootcamp-Homework/blob/main/Project%201/Docker%20ps%20ELK.PNG

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.9
- 10.0.0.10
- 10.0.0.11

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeats is used to collect log files with information that has changed and sends it to a logstash or Elasticsearch.
- Metricbeats collects specific metrics (IE:cpu, memory,data related services) on the specified servers and sends that information to a logstash or Elasticsearch.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to Ansible container.
- Update the filebeat-config.yml file to include your ELK Machine IP address. This will be done in the /etc/ansible/files/filebeat-config.yml and metricbeat-config.yml files. Find the sections output.elasticsearch and setup.kibana to amend the IP addresses appropriately to reflect your ELK machine IP address.


- Run the playbook, and navigate to Kibana to check that the installation worked as expected.

- The filebeat playbook is filebeat-playbook.yml, it is located at /etc/ansible/filebeat-playbook.yml. Metricbeat playbook is metricbeat-playbook.yml and is located at /etc/ansible/metricbeat-playbook.yml
- To update the file to have ansible run on a specific machine open the filebeat-playbook.yml file and edit the hosts line. The host.cfg file also needs to be updated to have the ELK server private IP address added to it. A new group name ELK gets added under groups and the private IP is added under it.
- To verify the ELK server is running navigate to URL http://[YourElkVmIP]:5601/app/kibana

- To download the playbook, the following commands are needed:
  - Open bash terminal window
  - ssh azureuser@JumpBoxPrivateIP
  - sudo docker container list -a
  - sudo docker start [container name] 
  - sudo docker attach [container name]
  - cd /etc/ansible
  - to run filebeat playbook run: ansible-playbook filebeat-playbook.yml
  - to run metricbeat playbook run: ansible-playbook metricbeat-playbook.yml
  - to verify everything is working properly, open web browser. 
  - Navigate to http://[yourELKVMPublicIP]:5601/app/kibana
  
- If everything is successful, you will now have data streaming in your filebeat and metricbeat discovery logs.  
  