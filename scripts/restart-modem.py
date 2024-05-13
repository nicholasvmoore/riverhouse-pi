import ubus
from datetime import datetime
from time import sleep

now = str(datetime.now())

def connectUbus(socket: str):
    ubus.connect(socket)
    return ubus

def disconnectUbus(connection: ubus):
    result = connection.disconnect()
    return result

def restartNetwork(connection: ubus):
    connection.call("network", "restart", {})
    return

def checkModemStatus(connection: ubus):
    status = connection.call("network.interface.modem_0001_4", "status", {})

    if status[0]['up'] == True:
        now = str(datetime.now())
        print(now + ': modem online')
        sleep(5)
        return True
    else:
        print(now + ": Modem offline, restarting network")  
        restartNetwork(connection)
        sleep(300)

def main():
    socket = "/var/run/ubus/ubus.sock"
    conn = connectUbus(socket)
    while True:
        checkModemStatus(conn)

if __name__ == '__main__':
    main()
