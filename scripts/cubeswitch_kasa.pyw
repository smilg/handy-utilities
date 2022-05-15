'''
When run with a command line argument, will dim the kasa smart bulb at a specific IP address.
Intended to be run by an AutoHotkey shortcut.
The following command line args are valid:
dim     (reduce brightness by 10% or to 1%)
bright  (increase brightness by 10% or to 100%)
toggle  (toggle the light's on/off state)
b       (set the brightness to a specific percentage)
c       (set the color to a specific RGB value (r, g, & b inputs should be between 0 and 100))
'''
#! /usr/bin/python3.8

from colorsys import rgb_to_hsv
import sys, asyncio
from time import sleep
from kasa import SmartBulb

DEVICE_IP = "192.168.86.123"

async def main():
    bulb = SmartBulb(DEVICE_IP)
    await bulb.update()
    action = sys.argv[1].strip()
    
    if action == "dim":
        await bulb.set_brightness(max(bulb.brightness-10, 1))
    elif action == "bright":
        await bulb.set_brightness(min(bulb.brightness+10, 100))
    elif action == "toggle":
        if bulb.is_off:
            await bulb.turn_on()
        else:
            await bulb.turn_off()
    elif action == "b":
        await bulb.set_brightness(int(sys.argv[2].strip()))
    elif action == "c":
        hsv = rgb_to_hsv(*[float(val.strip())/100 for val in sys.argv[2:5]])
        # rgb_to_hsv returns values between 0 and 1, and set_hsv takes ints with normal hsv
        # scaling (0-360°, 0-100%, 0-100%), so we need to scale and then round each value before use
        await bulb.set_hsv(*[round(val*scale) for val,scale in zip(hsv,[360,100,100])])

if __name__ == "__main__":
    if len(sys.argv) == 1:
        exit()
    print(sys.argv)
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(main())
