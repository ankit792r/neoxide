# NixOS Configuration with Flakes and Home Manager

A modular NixOS configuration featuring:
- **Flakes** for reproducible builds
- **Home Manager** for user-specific configurations
- **Niri** tiling window manager
- **SDDM** display manager
- Two host configurations: `minimal` (TTY-only) and `standard` (full desktop)

## Structure

```
neoxide/
├── flake.nix                 # Root flake configuration
├── hosts/
│   ├── minimal/
│   │   ├── configuration.nix # Minimal host system config
│   │   └── home.nix          # Minimal host home manager config
│   └── standard/
│       ├── configuration.nix # Standard host system config
│       └── home.nix          # Standard host home manager config
└── modules/                   # Pluggable modules
    ├── boot.nix              # Boot configuration
    ├── desktop.nix           # Desktop environment packages
    ├── networks.nix          # Network configuration
    ├── niri.nix              # Niri window manager
    ├── nix.nix               # Nix settings
    ├── packages.nix          # Essential system packages
    ├── services.nix          # Essential system services
    ├── sddm.nix              # SDDM display manager
    ├── tty.nix               # TTY-only configuration
    └── users.nix             # User configuration
```

## Hosts

### Minimal Host
- **Purpose**: TTY-only system with essential services
- **Features**:
  - No graphical environment
  - Essential system packages and utilities
  - Essential services (SSH, networking, etc.)
  - Terminal-based tools (tmux, ranger, neovim, etc.)

### Standard Host
- **Purpose**: Full desktop setup for daily use
- **Features**:
  - Niri tiling window manager
  - SDDM display manager
  - Complete desktop environment
  - All essential packages plus desktop applications
  - Waybar status bar
  - Mako notifications
  - Full development and productivity tools

## Modules

All modules in the `modules/` directory are pluggable and can be enabled/disabled by adding/removing them from the `imports` list in host configurations.

### Core Modules
- `nix.nix`: Nix settings and garbage collection
- `boot.nix`: Boot loader configuration
- `networks.nix`: Network configuration (iwd)
- `users.nix`: User accounts and groups

### Essential Modules
- `packages.nix`: Essential system packages
- `services.nix`: Essential system services (pipewire, SSH, etc.)

### Desktop Modules
- `sddm.nix`: SDDM display manager for Wayland
- `niri.nix`: Niri window manager system packages
- `desktop.nix`: Desktop environment packages and utilities

### Host-Specific Modules
- `tty.nix`: TTY-only configuration (used by minimal host)

## Usage

### Building and Switching

```bash
# Build and switch to minimal host
sudo nixos-rebuild switch --flake .#minimal

# Build and switch to standard host
sudo nixos-rebuild switch --flake .#standard

# Dry-run (test build without applying)
sudo nixos-rebuild build --flake .#standard

# Update flake inputs
nix flake update

# Show available configurations
nix flake show
```

### Customization

1. **Add a new module**: Create a file in `modules/` and import it in the desired host's `configuration.nix`
2. **Modify packages**: Edit `modules/packages.nix` or add to `home.packages` in host `home.nix` files
3. **Configure niri**: Edit the niri config in `hosts/standard/home.nix` (look for `xdg.configFile."niri/config.kdl"`)
4. **Change services**: Modify `modules/services.nix` or add service-specific modules

### Niri Configuration

Niri configuration is managed via Home Manager in `hosts/standard/home.nix`. The config file is created at `~/.config/niri/config.kdl`. You can:

- Edit the config directly in the home.nix file
- Or modify `~/.config/niri/config.kdl` after installation (changes will be overwritten on rebuild)

Key bindings (default):
- `Mod+Return`: Open terminal (alacritty)
- `Mod+d`: Application launcher (rofi)
- `Mod+q`: Close window
- `Mod+j/k`: Focus columns
- `Mod+h/l`: Focus windows
- `Mod+Shift+j/k`: Move columns
- `Mod+Shift+h/l`: Move windows
- `Mod+f`: Toggle fullscreen

### SDDM Session

SDDM is configured to work with Wayland. The niri session should be available in SDDM after installation. If not, you may need to create a session file manually.

## Requirements

- NixOS with flakes enabled
- Hardware configuration file (optional, can be generated with `nixos-generate-config`)

## Notes

- The configuration uses `nixos-24.11` and `home-manager release-24.11`
- Hardware-specific configuration should be placed in `hosts/*/hardware-configuration.nix`
- User name is set to `ankit` - change in `modules/users.nix` and home.nix files
- Some packages may require `allowUnfree = true` (already set in flake.nix)

## Troubleshooting

1. **Niri not starting**: Check that niri package is available and SDDM is configured for Wayland
2. **Missing packages**: Run `nix flake update` to update inputs
3. **Build errors**: Check that all module imports are correct and hardware-configuration.nix exists if referenced

