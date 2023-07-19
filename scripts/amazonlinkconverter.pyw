#! python3.11
'''
Shortens an Amazon link in the user's clipboard. Intended to be run by an AutoHotkey shortcut.
To use, select a long amazon link, copy it, and run the script. Your clipboard now contains a
shortened version of the same link.
'''

import re
import pyperclip

link = pyperclip.paste()

pid_match = re.search(r"\/([A-Z0-9]{10})(?:\/|\?|$)", link)
if pid_match == None:
    exit()
url = f"https://amzn.com/dp/{pid_match.group(1)}"
pyperclip.copy(url)
