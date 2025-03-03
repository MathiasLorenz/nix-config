{ ... }:
{
  # To pair, do:
  # bluetoothctl
  # scan on
  # when you see mac address of device
  # scan off
  # yank mac address
  # pair <mac-address>
  # trust <mac-address>
  # connect <mac-address>
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
}
