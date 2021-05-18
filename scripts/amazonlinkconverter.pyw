'''
Shortens an Amazon link in the user's clipboard. Intended to be run by an AutoHotKey shortcut.
To use, select a long amazon link, copy it, and run the script. Your clipboard now contains a
shortened version of the same link.
'''
#! /usr/bin/python3.8
import re
import pyperclip

link = pyperclip.paste()

pid_match = re.search(r"\/([A-Z0-9]{10})\/", link)  # type:ignore
if pid_match == None:
    pid_match = re.search(r"\/([A-Z0-9]{10})\?", link) # type:ignore
if pid_match == None:
    exit()
url = "https://amzn.com/{}".format(pid_match.group(1))
pyperclip.copy(url)
