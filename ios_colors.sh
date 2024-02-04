#!/bin/bash

echo $BASH_VERSION

# Cores no modo escuro
declare -A darkModeColors=(
    [SystemRed]="#FF453A" # Vermelho Vivo
    [SystemOrange]="#FF9F0A" #entretenimento Laranja Brilhante
    [SystemYellow]="#FFD60A" #metaverso Amarelo Sol
    [SystemGreen]="#30D158" #tecnologia verde Verde Esmeralda Claro
    [SystemMint]="#63E6E2" #gadget Menta Fresco
    [SystemTeal]="#40CBE0" # Azul-Verde Água
    [SystemCyan]="#64D2FF" # Ciano Celeste
    [SystemBlue]="#0A84FF" #software "Azul Céu Brilhante" ou "Azul Royal Claro"
    [SystemIndigo]="#5E5CE6" #ciência Índigo Suave
    [SystemPurple]="#BF5AF2" #inteligência artificial Roxo Vibrante
    [SystemPink]="#FF375F" # Rosa Choque
    [SystemBrown]="#A2845E" # Marrom Claro
    [SystemGray]="#8E8E93" #robôs Cinza Médio
    [SystemGray2]="#636366" #carros autônomos Cinza Escuro
    [SystemGray3]="#48484A" # Grafite
    [SystemGray4]="#3A3A3C" # Cinza Profundo
    [SystemGray5]="#2C2C2E" # Quase Preto
    [SystemGray6]="#1C1C1E" # Preto Sólido
    [SystemWhite]="#FFFFFF" # Branco Puro
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


