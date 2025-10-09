#!/bin/zsh

# -----------------------------
# macOS Python 3.13 + Tkinter Setup Script
# For Zsh shell (M1/M2 compatible)
# -----------------------------

# Function to print messages
print_msg() {
    echo "\n========== Installing Python 3.13 with Tkinter==========\n"
}

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    print_msg "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_msg "Homebrew already installed"
fi

# Install Tcl/Tk via Homebrew
print_msg "Installing Tcl/Tk..."
brew install tcl-tk

# Update Zsh profile for Tcl/Tk environment
ZPROFILE="$HOME/.zprofile"

print_msg "Updating $ZPROFILE with Tcl/Tk environment variables..."

grep -qxF 'export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"' $ZPROFILE || echo 'export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"' >> $ZPROFILE
grep -qxF 'export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"' $ZPROFILE || echo 'export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"' >> $ZPROFILE
grep -qxF 'export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"' $ZPROFILE || echo 'export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"' >> $ZPROFILE
grep -qxF 'export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"' $ZPROFILE || echo 'export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"' >> $ZPROFILE

# Reload profile
source $ZPROFILE

# Install/Reinstall Python 3.13 via Homebrew
print_msg "Installing/Reinstalling Python 3.13..."
brew reinstall python@3.13

# Add Homebrew Python 3.13 to PATH
grep -qxF 'export PATH="/opt/homebrew/opt/python@3.13/bin:$PATH"' $ZPROFILE || echo 'export PATH="/opt/homebrew/opt/python@3.13/bin:$PATH"' >> $ZPROFILE
source $ZPROFILE

# Verify installations
print_msg "Verifying installations..."

echo "Python version:"
python3 --version

echo "Tkinter test window should appear..."
python3 -c "import tkinter; tkinter._test()"

# Test tkinter
python3 -m tkinter

print_msg "Setup complete! Python 3.13 with Tkinter is ready."
