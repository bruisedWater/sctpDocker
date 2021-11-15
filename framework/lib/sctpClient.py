#!/usr/bin/python

import argparse
import sctp
import socket


def sendMessage(ip, port, message):
    sk = sctp.sctpsocket_tcp(socket.AF_INET)
    sk.connect((ip, int(port)))

    print("Sending Message: " + message)
    bytesSent = sk.sctp_send(msg=message)
    print(str(bytesSent) + " bytes sent")

    sk.shutdown(0)
    sk.close()

    return bytesSent


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("ip", help="the IP of the SCTP server you want to communicate with", type=str)
    parser.add_argument("port", help="the port of the SCTP server you want to communicate with", type=int)
    parser.add_argument("message", help="the message you want to send to the SCTP server", type=str)
    args = parser.parse_args()
    print('IP is ', args.ip)
    print('Port is ', args.port)
    print('Message is ', args.message)
    sendMessage(args.ip, args.port, args.message)
