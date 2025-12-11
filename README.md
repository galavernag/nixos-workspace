# Meu ambiente com NixOS

<div align='center'>
    <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR24sO0hEmaaS5yFeIa255HnyA_FyioAIicxA&s'>
</div>

![NixOS](https://img.shields.io/badge/NixOS-25.11-blue)
![Nix Flake](https://img.shields.io/badge/Nix%20Flake-enabled-success)

Configuração declarativa e reproduzível de um ambiente NixOS completo usando Nix Flakes, incluindo sistema operacional, aplicações, gerenciador de home-manager e múltiplos módulos personalizados.

## ✨ Características

- **Nix Flakes**: Gerenciamento de dependências reproduzível e determinístico
- **Home Manager**: Configuração declarativa do ambiente de usuário

## 📋 Pré-requisitos

- NixOS 25.11 ou superior (ou Nix em outro sistema Linux)
- Git
- ~10GB de espaço em disco (para construção inicial)

## 📁 Estrutura do Projeto

```
.
├── flake.nix                          # Definição principal do Flake
├── README.md                          # Este arquivo
├── applications/                      # Configurações de aplicações globais
│   ├── nh.nix                        # Gerenciador Nix
│   ├── niri.nix                      # Compositor Wayland
│   └── noctalia.nix                  # Shell interativo
├── hosts/                            # Configurações por host
│   └── nixos/
│       ├── configuration.nix         # Configuração principal do sistema
│       └── hardware-configuration.nix # Detectado automaticamente
├── modules/                          # Módulos reutilizáveis do sistema
│   ├── audio.nix                    # Configuração de áudio (PulseAudio/ALSA)
│   ├── desktop.nix                  # Ambiente desktop
│   ├── flatpak.nix                  # Integração com Flatpak
│   ├── fonts.nix                    # Gerenciamento de fontes
│   ├── gaming.nix                   # Suporte a gaming (Steam, Proton, etc.)
│   ├── localisation.nix             # Localização e idiomas
│   ├── networking.nix               # Configuração de rede
│   ├── nix-settings.nix             # Configurações do Nix
│   ├── services.nix                 # Serviços do sistema
│   ├── users.nix                    # Configuração de usuários
│   ├── virtualisation.nix           # Suporte a Docker, KVM, etc.
│   └── wine.nix                     # Suporte a Wine para executáveis Windows
└── users/                           # Configurações específicas de usuários
    └── galavernag/
        ├── home.nix                 # Configuração Home Manager principal
        ├── applications/            # Aplicações específicas do usuário
        │   ├── alacritty.nix       # Emulador de terminal
        │   ├── flatpak.nix         # Flatpak pessoal
        │   ├── git.nix             # Configuração Git
        │   ├── noctalia.nix        # Noctalia pessoal
        │   ├── starship.nix        # Prompt de shell
        │   ├── zsh.nix             # Shell Zsh
        │   └── niri/               # Configuração do Niri
        │       ├── config.kdl      # Arquivo de configuração KDL
        │       └── default.nix     # Módulo Niri
        └── modules/
            └── environment-variables.nix # Variáveis de ambiente personalizadas
```

## 🚀 Instalação

```bash
sudo nixos-rebuild boot --flake github:galavernag/nixos-workspace#nixos
```

### Atualizações Subsequentes

```bash
# Atualizar flake.lock
nix flake update

# Aplicar a nova configuração
nh os switch
```

## 📖 Uso

### Comandos Comuns

```bash
# Aplicar alterações na configuração
nh os switch

# Testar alterações sem aplicar
nh os test

# Atualizar inputs do Flake
nix flake update

# Verificar sintaxe (sem aplicar)
nix flake check
```
## 📦 Módulos

### Audio (`modules/audio.nix`)
Configuração de áudio do sistema com Pipewire.

### Flatpak (`modules/flatpak.nix`)
Suporte a Flatpak com integração do Nix para gerenciamento declarativo.

### Fonts (`modules/fonts.nix`)
Gerenciamento de fontes do sistema para aplicações desktop.

### Gaming (`modules/gaming.nix`)
Suporte a jogos com Steam, Proton, e outras ferramentas de gaming.

### Localisation (`modules/localisation.nix`)
Configuração de idioma, timezone e localização regional.

### Networking (`modules/networking.nix`)
Configuração de rede, WiFi, DNS e conectividade.

### Nix Settings (`modules/nix-settings.nix`)
Otimizações e configurações específicas do Nix.

### Services (`modules/services.nix`)
Serviços do sistema (SSH, HTTP, etc.).

### Users (`modules/users.nix`)
Definição de usuários do sistema e configurações de permissões.

### Virtualisation (`modules/virtualisation.nix`)
Docker, KVM, QEMU e outras ferramentas de virtualização.

### Wine (`modules/wine.nix`)
Suporte para executar aplicações Windows com Wine/Proton.

## 🎯 Aplicações

### Principais
- **Niri**: Compositor Wayland moderno e tiling window manager
- **Noctalia**: Shell interativo com suporte a múltiplas funcionalidades
- **nh**: Ferramenta auxiliar para gerenciar NixOS e Home Manager

### Aplicações do Usuário
- **Alacritty**: Emulador de terminal GPU-acelerado
- **Zsh**: Shell com completamento avançado
- **Git**: Controle de versão configurado
- **Neovim**: Editor de texto avançado
- **Zed**: Editor moderno e rápido
- **Dolphin**: Gerenciador de arquivos KDE