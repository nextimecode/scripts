#!/bin/bash

echo $BASH_VERSION

# Cores no modo escuro
declare -A darkModeColors=(
    [SystemRed]="#FF453A"
    [SystemOrange]="#FF9F0A"
    [SystemYellow]="#FFD60A"
    [SystemGreen]="#30D158"
    [SystemMint]="#63E6E2"
    [SystemTeal]="#40CBE0"
    [SystemCyan]="#64D2FF"
    [SystemBlue]="#0A84FF"
    [SystemIndigo]="#5E5CE6"
    [SystemPurple]="#BF5AF2"
    [SystemPink]="#FF375F"
    [SystemBrown]="#A2845E"
    [SystemGray]="#8E8E93"
    [SystemGray2]="#636366"
    [SystemGray3]="#48484A"
    [SystemGray4]="#3A3A3C"
    [SystemGray5]="#2C2C2E"
    [SystemGray6]="#1C1C1E"
    [SystemWhite]="#FFFFFF"
)

# Cores no modo claro
declare -A lightModeColors=(
    [SystemRed]="#FF3B30"
    [SystemOrange]="#FF9500"
    [SystemYellow]="#FFCC00"
    [SystemGreen]="#34C759"
    [SystemMint]="#00C7BE"
    [SystemTeal]="#30B0C7"
    [SystemCyan]="#32ADE6"
    [SystemBlue]="#007AFF"
    [SystemIndigo]="#5856D6"
    [SystemPurple]="#AF52DE"
    [SystemPink]="#FF2D55"
    [SystemBrown]="#A2845E"
    [SystemBlack]="#000000"
    [SystemGray]="#8E8E93"
    [SystemGray2]="#AEAEB2"
    [SystemGray3]="#C7C7CC"
    [SystemGray4]="#D1D1D6"
    [SystemGray5]="#E5E5EA"
    [SystemGray6]="#F2F2F7"
    [SystemWhite]="#FFFFFF"
)

# Função para imprimir cores
print_colors() {
    declare -n colors=$1
    mode=$2
    for color in "${!colors[@]}"; do
        echo "$color (${mode} Mode): ${colors[$color]}"
    done
}

# Imprimir cores
echo "Cores do iOS 17 no Modo Escuro:"
print_colors darkModeColors "Dark"

echo ""
echo "Cores do iOS 17 no Modo Claro:"
print_colors lightModeColors "Light"


