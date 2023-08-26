#!/bin/sh

# Import the constants
source /Users/pedroduarte/Dev/scripts/constants.sh

display_colors_and_styles() {
    local description=$1
    local style=$2

    printf "${style}${description}${RESET}\n"
}

printf "\n${BOLD_TEXT}COLORS:\n"

display_colors_and_styles "BLUE" $BLUE
display_colors_and_styles "YELLOW" $YELLOW
display_colors_and_styles "RED" $RED
display_colors_and_styles "BLACK" $BLACK
display_colors_and_styles "GREEN" $GREEN
display_colors_and_styles "BROWN_ORANGE" $BROWN_ORANGE
display_colors_and_styles "PURPLE" $PURPLE
display_colors_and_styles "CYAN" $CYAN
display_colors_and_styles "LIGHT_GRAY" $LIGHT_GRAY
display_colors_and_styles "DARK_GRAY" $DARK_GRAY
display_colors_and_styles "BRIGHT_RED" $BRIGHT_RED
display_colors_and_styles "BRIGHT_GREEN" $BRIGHT_GREEN
display_colors_and_styles "BRIGHT_BLUE" $BRIGHT_BLUE
display_colors_and_styles "BRIGHT_PURPLE" $BRIGHT_PURPLE
display_colors_and_styles "BRIGHT_CYAN" $BRIGHT_CYAN
display_colors_and_styles "WHITE" $WHITE

printf "\n${BOLD_TEXT}TEXT STYLES:\n"

display_colors_and_styles "SIMPLE_TEXT" $SIMPLE_TEXT
display_colors_and_styles "BOLD_TEXT" $BOLD_TEXT
display_colors_and_styles "LOW_INTENSITY_TEXT" $LOW_INTENSITY_TEXT
display_colors_and_styles "UNDERLINE_TEXT" $UNDERLINE_TEXT
display_colors_and_styles "BLINKING_TEXT" $BLINKING_TEXT
display_colors_and_styles "STRIKETHROUGH_TEXT" $STRIKETHROUGH_TEXT
printf "\n"  # Adicionada quebra de linha após o último texto
