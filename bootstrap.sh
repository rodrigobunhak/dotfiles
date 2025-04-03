#!/bin/bash

# Configurações
DOTFILES_REPO="git@github.com:rodrigobunhak/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
ZSHRC_PATH="$DOTFILES_DIR/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"

echo "🔧 Iniciando o bootstrap do Manjaro..."

# 1️⃣ Atualizando pacotes
echo "📦 Atualizando pacotes..."
sudo pacman -Syu --noconfirm

# 2️⃣ Instalando Git
echo "🐙 Instalando Git..."
sudo pacman -S git --noconfirm --needed

# 3️⃣ Clonando repositório de dotfiles (via SSH)
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "📂 Clonando repositório de dotfiles via SSH..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "✅ Repositório de dotfiles já existe."
fi

# 4️⃣ Criando symlink do .zshrc
if [ -f "$ZSHRC_PATH" ]; then
    echo "🔗 Criando link simbólico para .zshrc..."
    ln -sf "$ZSHRC_PATH" "$ZSHRC_DEST"
else
    echo "⚠️ Arquivo .zshrc não encontrado no repositório!"
fi

# 5️⃣ Instalando Zsh
echo "🐚 Instalando Zsh..."
sudo pacman -S zsh --noconfirm --needed

echo "✅ Bootstrap concluído!"

