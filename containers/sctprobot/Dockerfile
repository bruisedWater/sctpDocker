# syntax=docker/dockerfile:1
FROM aweimeow/sctp-server
RUN apt install lksctp-tools
RUN apt install -y python3-pip libsctp-dev python-dev
RUN pip3 install robotframework
EXPOSE 9992
CMD ["sleep", "infinity"]
