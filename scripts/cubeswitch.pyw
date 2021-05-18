'''
When run with a command line argument, will dim the WiZ smart bulb at the IP address 192.168.1.128.
Intended to be run by an AutoHotKey shortcut.
The following command line args are valid:
cube_lamp_dim
cube_lamp_bright
cube_lamp_toggle
'''
#! /usr/bin/python3.8

import sys, asyncio
from pywizlight import wizlight, PilotBuilder   # type:ignore

if sys.argv[1] == None:
    exit()

action = sys.argv[1].strip()

light = wizlight("192.168.1.128")
status = asyncio.run(light.updateState())
state = status.get_state()
brightness = status.get_brightness()

if action == "cube_lamp_dim":
    newbrightness = brightness - 20
    if newbrightness < 1:
        newbrightness = 0
    asyncio.run(light.turn_on(PilotBuilder(brightness = newbrightness)))
elif action == "cube_lamp_bright":
    newbrightness = brightness + 20
    if newbrightness > 255:
        newbrightness = 255
    asyncio.run(light.turn_on(PilotBuilder(brightness = newbrightness)))
elif action == "cube_lamp_toggle":
    if state == False:
        asyncio.run(light.turn_on())
    else:
        asyncio.run(light.turn_off())
