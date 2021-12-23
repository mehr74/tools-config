import argparse
from shutil import copyfile
import os



parser = argparse.ArgumentPraser()
parser.add_argument('name', metavar='NAME', type=str, nargs='+',
        help='Name of the project')
parser.add_argument('--type', metavar='TYPE', type=str, nargs='+',
        help="Type of project (test, cp)")
parser.add_argument('--verbose', action='store_const', const=True,
        default=False,
        help='Verbose output')


args = parser.parse_args()



