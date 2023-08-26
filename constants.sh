#!/bin/sh

# Blue: For informational messages.
BLUE='\033[0;34m'
# Yellow: For warnings.
YELLOW='\033[1;33m'
# Red: For errors or critical issues.
RED='\033[1;31m'
# No color: Reset the color.
RESET='\033[0m'
# Black: Less commonly used for text.
BLACK='\033[0;30m'
# Green: For success messages.
GREEN='\033[0;32m'
# Brown/Orange: Less commonly used, but can be used for highlights.
BROWN_ORANGE='\033[0;33m'
# Purple: Status.
PURPLE='\033[0;35m'
# Cyan: Checking
CYAN='\033[0;36m'
# Light Gray: Can be used for subdued text.
LIGHT_GRAY='\033[0;37m'
# Dark Gray: Less commonly used for text.
DARK_GRAY='\033[1;30m'
# Bright Red: A more intense version of red.
BRIGHT_RED='\033[1;31m'
# Bright Green: A more intense version of green.
BRIGHT_GREEN='\033[1;32m'
# Bright Blue: A more intense version of blue.
BRIGHT_BLUE='\033[1;34m'
# Bright Purple: A more intense version of purple.
BRIGHT_PURPLE='\033[1;35m'
# Bright Cyan: A more intense version of cyan.
BRIGHT_CYAN='\033[1;36m'
# White: For very highlighted text.
WHITE='\033[1;37m'

# Text Styles
SIMPLE_TEXT='\033[0m'
BOLD_TEXT='\033[1m'
LOW_INTENSITY_TEXT='\033[2m'
UNDERLINE_TEXT='\033[4m'
BLINKING_TEXT='\033[5m'
INVISIBLE_TEXT='\033[8m'
STRIKETHROUGH_TEXT='\033[9m'
