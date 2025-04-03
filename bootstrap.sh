#!/bin/bash

# Configuração
DOTFILES_REPO="git@github.com:rodrigobunhak/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo "🔧 Iniciando o bootstrap do Linux..."

# 3️⃣ Baixando seus dotfiles do GitHub
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "📂 Clonando repositório de dotfiles..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "✅ Repositório de dotfiles já existe."
fi

echo "✅ Bootstrap concluído! Agora você pode configurar seus dotfiles."

