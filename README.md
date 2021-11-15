____________
sctp-compose

This is an exercise in getting an SCTP server up and running in a docker container via docker-compose
and running a couple of tests with Robot.

------------
INSTALLATION
Requirements:
 - Docker engine and docker-compose installed on the host.

 - NOTE: It his highly reccomended to deploy on an Ubuntu host.
         This repo has been tested exclusively on Ubuntu hosts.

Clone the repo to your host machine, cd into its root directory and bring up the env with:
```
docker-compose up
```
When deployed it will bring up two containers:
 - A container for the SCTP server (sctpubuntu...)
 - A container for the robot test cases (sctprobot...)

Note the IP of the eth0 interface of the SCTP server container with something like:
```
docker exec -ti containers_sctpubuntu_1 ip a | grep eth0
```

-----------------------
EXECUTION of TEST CASES
Exec into the robot container and cd into the directory containing the robot test cases:
```
docker exec -ti containers_sctprobot_1 bash
cd /root/framework/cases/
```
Verify that the IP of the SCTP server found above is the one used in the test cases file. E.g.
```
vim tests.robot
...
${sctpServerIP}      192.168.16.2    # Change this to the IP of your SCTP server
...
```
Execute the TCs:
`robot tests.robot`
Once completed the artifacts of the execution will be available to you directly on the host under
`[PATH_TO_REPO]/sctp-compose/framework/cases`


-----
TODOs
- Test in other than a Ubuntu host.

- Feed the IP of SCTP server container to the robot suite automatically.

- Find a newer docker image for the SCTP server or build on based on latest Ubuntu
    - python3?

- Add two way communication between client/server?
  Reply now is bytes sent, maybe we need the server to actually reply with something.

- Robot container to be based on image of sctp server container? ...and just add robot on top?
