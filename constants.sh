#!/bin/sh

BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'
BLACK='\033[0;30m'
GREEN='\033[0;32m'
BROWN_ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
BRIGHT_RED='\033[1;31m'
BRIGHT_GREEN='\033[1;32m'
BRIGHT_BLUE='\033[1;34m'
BRIGHT_YELLOW='\033[1;33m'
BRIGHT_PURPLE='\033[1;35m'
BRIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'

ERROR=$BRIGHT_RED
WARNING=$BRIGHT_YELLOW
INFO=$BRIGHT_CYAN
SUCCESS=$BRIGHT_GREEN

# Emojis
SUCCESS_EMOJI=✅
WARNING_EMOJI=⚠️
EXECUTING_EMOJI=⚙️
ERROR_EMOJI=❌
CHECKING_EMOJI=🔍
INFO_EMOJI=ℹ️

# Text Styles
SIMPLE_TEXT='\033[0m'
BOLD_TEXT='\033[1m'
LOW_INTENSITY_TEXT='\033[2m'
UNDERLINE_TEXT='\033[4m'
BLINKING_TEXT='\033[5m'
INVISIBLE_TEXT='\033[8m'
STRIKETHROUGH_TEXT='\033[9m'
