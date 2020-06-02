import pytuya
# [ { id: '01577056807d3a41ce6f', key: '6af1633f81f8041b' } ]
d = pytuya.OutletDevice('01577056807d3a41ce6f', '192.168.0.11', 'foobar')
# d = pytuya.OutletDevice('DEVICE_ID_HERE', 'IP_ADDRESS_HERE', 'LOCAL_KEY_HERE')
data = d.status()  # NOTE this does NOT require a valid key
print('Dictionary %r' % data)
print('state (bool, true is ON) %r' % data['dps']['1'])  # Show status of first controlled switch on device

# Toggle switch state
switch_state = data['dps']['1']
if (switch_state == True):
    print('Ligth is on')
    x = input('Do you want to switch it off? (y/n)')
    print('Response is, ' + x)
    if (x == 'y'):
        data = d.set_status(False, 1)
else:
    print('Ligth is off')
    x = input('Do you want to switch it on? (y/n)')
    print('Response is, ' + x)
    if (x == 'y'):
        data = d.set_status(True, 1)
# data = d.set_status(not switch_state)  # This requires a valid key
# print('data is' % data)

# if data:
#     print('set_status() result %r' % data)
#
# # on a switch that has 4 controllable ports, turn the fourth OFF (1 is the first)
# data = d.set_status(False, 4)
# if data:
#     print('set_status() result %r' % data)
#     print('set_status() extrat %r' % data[20:-8])
