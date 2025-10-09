# 🧰 System Configuration Scripts

This repository provides a collection of curated shell scripts to automate the setup and configuration of development environments on macOS, Ubuntu, and Fedora.

## ✨ Features

- ⚙️ **Post-Installation:** Automates updates, installs essential tools, and applies common environment tweaks.
- 🧩 **System Configuration:** Optimizes system settings for development and general use.
- 💻 **Developer Toolkit:** Sets up package managers (like Homebrew), shells (like Zsh), and other developer utilities.
- 🔒 **Security & Performance:** Implements basic security hardening and performance enhancements.

## 🖥️ Supported Operating Systems

- 🍎 **macOS** (via Zsh scripts)
- 🐧 **Linux** (via Bash scripts)
  - Ubuntu
  - Fedora 25 (*Note: This is an older version of Fedora. Compatibility with newer versions may vary.*)

## 🚀 Getting Started

### Prerequisites

- `git` must be installed to clone the repository.
- You will need `sudo` or root privileges to run scripts that modify system settings.

### Installation & Usage

1.  Clone the repository to your local machine:
    ```sh
    git clone https://github.com/your-username/System-Configuration_SH.git
    cd System-Configuration_SH
    ```

2.  Navigate to the directory for your operating system (e.g., `macos` or `ubuntu`).

3.  Review the script you intend to run to understand the changes it will make.

4.  Make the script executable and run it. For example, to run a setup script on macOS:
    ```sh
    chmod +x macos/setup.sh
    ./macos/setup.sh
    ```

## 🤝 Contributing

Contributions are welcome! If you have improvements or scripts for other operating systems, please feel free to open a pull request.

## 📜 License

This project is licensed under the **GNU General Public License v3.0**. See the [LICENSE](https://github.com/vbppl/System-Configuration_SH/blob/main/LICENSE) file for details.
