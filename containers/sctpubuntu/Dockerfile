# syntax=docker/dockerfile:1
FROM aweimeow/sctp-server
RUN apt-get update && apt-get install -y lksctp-tools
EXPOSE 9991
CMD ["sctp_test", "-H", "0.0.0.0", "-P", "9991", "-l"]
