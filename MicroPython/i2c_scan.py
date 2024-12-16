import machine
i2c = machine.I2C(scl=machine.Pin(1), sda=machine.Pin(0))

print('Scanning I2C...')
devices = i2c.scan()

if len(devices) == 0:
  print("No I2C Devices Found.")
else:
  print('I2C Devices: ',len(devices))

  for device in devices:  
    print("Address: ",device," | Hex address: ",hex(device))
