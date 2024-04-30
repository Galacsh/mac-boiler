#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# ===================================

program_to_install=$1
program_name=$(basename "$program_to_install")

info "Going to install '${program_name}'..."

# ========================================

on_launch_dir="${HOME}/on-launch"
mkdir -p "$on_launch_dir"

copied_program="${on_launch_dir}/${program_name}"
cp "${program_to_install}" "${copied_program}"

info "Copied to '${copied_program}'"

# =======================================

prefix='on.launch'
plist_name="${prefix}.${program_name%.*}"
plist_basename="${plist_name}.plist"
plist_path="${HOME}/Library/LaunchAgents/${plist_basename}"

touch "${plist_path}"
cat << EOF > "${plist_path}"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>${plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>${copied_program}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
  </dict>
</plist>
EOF

info "Created plist file '${plist_path}'."

chmod 755 "${copied_program}"
chmod 644 "${plist_path}"

info 'Needs reboot to take effect.'
info "To undo, run these commands.

  rm ${copied_program}
  rm ${plist_path}
"
