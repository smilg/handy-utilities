import sys
import os
import pathlib
import configparser
from win10toast import ToastNotifier
from typing import Any
import argparse

CONFIG_FILE_NAME = 'wslconfig.ini'
WSL_SCRIPT_PATH = pathlib.Path('C:/WSL/xWSL/')

toast = ToastNotifier()

class WSLDistroNotFoundError(Exception):
    def __init__(self, distro_name, message='WSL Distro not found with "wsl -l"'):
        self.distro_name = distro_name
        self.message = message
        super().__init__(message)

def file_exists(path):
    if path.exists():
        if not path.is_dir():
            return True
        else:
            toast.show_toast('Error: Is A Directory',
                        f'The specified file path {path} is a directory!',
                        duration=3, threaded=True)
            raise IsADirectoryError(path)
    else:
        toast.show_toast('Error: File Not Found',
                        f'The file at {path} does not exist!',
                        duration=3, threaded=True)
        raise FileNotFoundError(path)

def wsl_distro_exists(distro_name):
    wsl_distros = get_wsl_distros()
    # throw error if specified wsl distro doesn't exist
    if distro_name not in wsl_distros:
        toast.show_toast('Error: WSL Distro Doesn\'t Exist',
                        f'The specified WSL distro "{distro_name}" does not exist.',
                        duration=3, threaded=True)
        raise WSLDistroNotFoundError(distro_name)
    return True

def get_wsl_distros():
    # get list of installed WSL distros and process it into just a list of distro names
    wsl_distros = [line.replace('\x00', '').strip() 
                    for line in os.popen('wsl -l').readlines()[1:]]
    wsl_distros = list(filter(lambda line: line != '', wsl_distros))
    default_distro = ''
    if wsl_distros[0][-10:] == ' (Default)':
        wsl_distros[0] = wsl_distros[0][0:-10]
        default_distro = wsl_distros[0]

    return (wsl_distros, default_distro)

def write_config_option(key, value):
    config = configparser.ConfigParser()
    config['wsl.py'][key] = value
    with open(CONFIG_FILE_NAME, 'w') as config_file:
        config.write(config_file)

def set_default_rdp(rdp_path):
    file_exists(pathlib.Path(rdp_path))
    write_config_option('default_rdp', rdp_path)

def set_default_wsl(distro_name):
    wsl_distro_exists(pathlib.Path(distro_name))
    write_config_option('default_distro', distro_name)

def xwsl_toast(toaster, message):
    toaster.show_toast('xWSL', message,
                    duration=3, threaded=True)

def get_parser(name):
    '''
    Return the command-line argument parser used for this script.

    Args:
        name: A string representing the name of the script.

    Returns:
        An argparse namespace representing the successfully parsed arguments'
        names and values.
    '''

    parser = argparse.ArgumentParser(name)
    parser.add_argument('-i', '--init', action='store_true')
    parser.add_argument('-r', '--restart', action='store_true')
    parser.add_argument('-s', '--shutdown', action='store_true')
    parser.add_argument('-x', '--rdp', action='store_true')
    return parser

def main(args):
    parser = get_parser(args[0])
    parsed_args = parser.parse_args(args[1:])
    if parsed_args.init:
        xwsl_toast(toast, 'Initializing xWSL')
        os.system(str(WSL_SCRIPT_PATH / 'init.cmd'))
    if parsed_args.restart:
        xwsl_toast(toast, 'Restarting xWSL')
        os.system(str(WSL_SCRIPT_PATH / 'reboot.cmd'))
    if parsed_args.shutdown:
        xwsl_toast(toast, 'Terminating xWSL')
        os.system(str(WSL_SCRIPT_PATH / 'terminate.cmd'))
    if parsed_args.rdp:
        xwsl_toast(toast, 'Starting xWSL remote desktop')
        os.system(f'mstsc.exe \"{str(WSL_SCRIPT_PATH / "xWSL (jacob) Desktop.rdp")}\"')

if __name__ == '__main__':
    main(sys.argv)


# class Config:
#     def __init__(self, file_path):
#         self._file_path = file_path
#         with open(self._file_path, 'w+') as config_file:
#             self.__dict = json.load(config_file)

#     def __getattr__(self, name: str) -> Any:
#         try:
#             return self.__dict[name]
#         except KeyError:
#             raise AttributeError(f'{type(self).__name__} object has no attribute {name}')
    
#     def __setattr__(self, name: str, value: Any) -> None:
#         self.__dict[name] = value
#         with open(self._file_path, 'w+') as config_file:
#             json.dump(config_file, self.__dict)
    
#     def __delattr__(self, name: str) -> None:
#         del self.__dict[name]