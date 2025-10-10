#!/bin/zsh

# -----------------------------
# Installs Tcl/Tk and Python and configures the environment
# Detects shell, Homebrew path, and sets environment variables
# Works for both old Intel and Apple Silicon (M1,M2,M3,M4) Macs
# -----------------------------


# Log all output to a file
LOG_FILE="$HOME/tkinter_macos.log"
exec > >(tee -a "$LOG_FILE") 2>&1


# Function to print messages
print_msg() {
    echo "\n========== $1 ==========\n"
}


# Detect user shell and profile file
USER_SHELL=$(basename "$SHELL")
case "$USER_SHELL" in
    zsh) PROFILE_FILE="$HOME/.zprofile" ;;
    bash) PROFILE_FILE="$HOME/.bash_profile" ;;
    *) PROFILE_FILE="$HOME/.profile" ;;
esac
print_msg "Detected shell: $USER_SHELL → using profile: $PROFILE_FILE"

# Function to safely add line to profile
add_to_profile() {
    local line="$1"
    grep -qxF "$line" "$PROFILE_FILE" 2>/dev/null || echo "$line" >> "$PROFILE_FILE"
}



# Install Xcode Command Line Tools if missing
if ! xcode-select -p &>/dev/null; then
    print_msg "Installing Xcode Command Line Tools..."
    xcode-select --install
else
    print_msg "Xcode Command Line Tools already installed"
fi


# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    print_msg "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_msg "Homebrew already installed"
fi


# Ensure Homebrew environment is loaded
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Also load if brew is already in PATH
if command -v brew &> /dev/null; then
    eval "$(brew shellenv)"
fi


# Ensure Homebrew is up to date
print_msg "Updating Homebrew..."
brew update
brew upgrade

# Get Homebrew prefix dynamically
BREW_PREFIX=$(brew --prefix)
print_msg "Homebrew prefix detected at $BREW_PREFIX"


# Install Tkinter (Tcl/Tk) via Homebrew
print_msg "Installing Tcl/Tk..."
brew install tcl-tk


# Update environment variables
print_msg "Updating $PROFILE_FILE with Tcl/Tk environment variables..."

# Remove old Tcl/Tk paths from profile
sed -i.bak -E "/tcl-tk/d" "$PROFILE_FILE"

# Add new Tcl/Tk paths to profile
if ! grep -qxF "export PATH=\"$BREW_PREFIX/opt/tcl-tk/bin:\$PATH\"" "$PROFILE_FILE"; then
    echo "export PATH=\"$BREW_PREFIX/opt/tcl-tk/bin:\$PATH\"" >> "$PROFILE_FILE"
fi

if ! grep -qxF "export LDFLAGS=\"-L$BREW_PREFIX/opt/tcl-tk/lib\"" "$PROFILE_FILE"; then
    echo "export LDFLAGS=\"-L$BREW_PREFIX/opt/tcl-tk/lib\"" >> "$PROFILE_FILE"
fi

if ! grep -qxF "export CPPFLAGS=\"-I$BREW_PREFIX/opt/tcl-tk/include\"" "$PROFILE_FILE"; then
    echo "export CPPFLAGS=\"-I$BREW_PREFIX/opt/tcl-tk/include\"" >> "$PROFILE_FILE"
fi

if ! grep -qxF "export PKG_CONFIG_PATH=\"$BREW_PREFIX/opt/tcl-tk/lib/pkgconfig\"" "$PROFILE_FILE"; then
    echo "export PKG_CONFIG_PATH=\"$BREW_PREFIX/opt/tcl-tk/lib/pkgconfig\"" >> "$PROFILE_FILE"
fi
source $PROFILE_FILE # Reload profile to apply changes

# Remove old Python paths from profile
sed -i.bak -E "/python[^ ]*\/bin/d" "$PROFILE_FILE"

# Install/Reinstall latest Python via Homebrew
print_msg "Installing/Reinstalling latest Python..."
brew reinstall python # if you want to install a specific version, use `brew reinstall python@3.x`

# Set Python path
if ! grep -qxF "export HOMEBREW_PYTHON=\"$BREW_PREFIX/bin/python3\"" "$PROFILE_FILE"; then
    echo "export HOMEBREW_PYTHON=\"$BREW_PREFIX/bin/python3\"" >> "$PROFILE_FILE"
fi

# Add Homebrew Python to PATH
if ! grep -qxF "export PATH=\"$BREW_PREFIX/bin/python3:\$PATH\"" "$PROFILE_FILE"; then
    echo "export PATH=\"$BREW_PREFIX/bin:\$PATH\"" >> "$PROFILE_FILE"
fi
source $PROFILE_FILE # Reload profile to apply changes


# Verify installations
print_msg "Verifying installations..."

# Check if latest Python is installed
if ! command -v "$HOMEBREW_PYTHON" &> /dev/null; then
    print_msg "Python installation failed. Check $LOG_FILE"
    exit 1
fi
print_msg "Python installed successfully at $HOMEBREW_PYTHON"
$HOMEBREW_PYTHON --version

# Check Python version
echo "Python version:"
$HOMEBREW_PYTHON --version

# Check if Tcl/Tk is installed (Pop up window should appear)
print_msg "Verifying Tcl/Tk installation..."
echo "Tkinter test window should appear..."
$HOMEBREW_PYTHON -c "import tkinter; tkinter._test()"

# Test tkinter
# echo "Tkinter test window should appear..."
# HOMEBREW_PYTHON -m tkinter

# Check if Tkinter (Tcl/Tk) is installed (by imported and initializing) without pop-up window (silently)
print_msg "Verifying Tcl/Tk installation..."
$HOMEBREW_PYTHON - <<'EOF'
import tkinter
root = tkinter.Tk()
print("Tkinter initialized successfully with:", root.tk.call('info', 'patchlevel'))
root.destroy()
EOF

print_msg "Setup complete! Python with Tkinter is ready."
echo "Full log saved at $LOG_FILE"