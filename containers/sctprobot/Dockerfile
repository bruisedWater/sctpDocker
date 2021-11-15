# syntax=docker/dockerfile:1
FROM aweimeow/sctp-server
RUN apt-get update && apt-get install -y lksctp-tools python-pip libsctp-dev python-dev
RUN pip install robotframework
CMD ["sleep", "infinity"]
