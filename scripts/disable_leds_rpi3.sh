# https://raspberrypi.stackexchange.com/questions/117632/turn-off-external-leds-on-raspberry-pi-3

# check model
cat /sys/firmware/devicetree/base/model
# Raspberry Pi 3 Model B Rev 1.2

# Disable Power (red) and Activity (yellow) leds
sudo nano /etc/rc.local
# Add the following lines before `exit 0`:
sudo sh -c 'echo none > /sys/class/leds/ACT/trigger'
sudo sh -c 'echo none > /sys/class/leds/PWR/trigger'
sudo sh -c 'echo 0 > /sys/class/leds/ACT/brightness'
sudo sh -c 'echo 0 > /sys/class/leds/PWR/brightness'

# Disable LAN/Ethernet leds by using lan951x-led-ctl
sudo apt-get install libusb-1.0-0-dev
git clone https://github.com/dumpsite/lan951x-led-ctl.git
cd lan951x-led-ctl/
make
cd ..
sudo cp -R lan951x-led-ctl /opt

# disable lan leds
#sudo ./lan951x-led-ctl --fdx=0 --lnk=0 --spd=0
# setting FDX LED to status 0
# setting LNK LED to status 0
# setting SPD LED to status 0

# enable lan leds
#sudo ./lan951x-led-ctl --fdx=1 --lnk=1 --spd=1
# setting FDX LED to status 1
# setting LNK LED to status 1
# setting SPD LED to status 1

# Let's modify the rc.local from a fresh install to include the disable LED commands

sed -i '/^exit 0$/isudo\ sh\ -c\ echo\ none\ \>\ \/sys\/class\/leds\/ACT\/trigger' rc.local
sed -i '/^exit 0$/isudo\ sh\ -c\ echo\ none\ \>\ \/sys\/class\/leds\/PWR\/trigger' rc.local
sed -i '/^exit 0$/isudo\ sh\ -c\ echo\ 0\ \>\ \/sys\/class\/leds\/ACT\/trigger' rc.local
sed -i '/^exit 0$/isudo\ sh\ -c\ echo\ 0\ \>\ \/sys\/class\/leds\/PWR\/trigger' rc.local
sed -i '/^exit 0$/isudo\ sh\ -c\ "sudo /opt/lan951x-led-ctl/lan951x-led-ctl\ --fdx=0\ --lnk=0\ --spd=0"' rc.local
