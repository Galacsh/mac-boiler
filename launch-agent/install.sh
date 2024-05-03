#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

program_to_install=$1
on_launch_dir="${HOME}/on-launch"
plist_prefix='on.launch'

# ===============================================

# get program name
program_name=$(basename "$program_to_install")
log "Going to install '${program_name}'..."

# create directory to store the program
mkdir -p "$on_launch_dir"
log "Created '${on_launch_dir}'..."

# copy the program to the created directory
copied_program="${on_launch_dir}/${program_name}"
cp "${program_to_install}" "${copied_program}"
log "Copied script to '${copied_program}'..."

# create plist file
log "Creating plist file..."
plist_name="${plist_prefix}.${program_name%.*}"
plist_basename="${plist_name}.plist"
plist_path="${HOME}/Library/LaunchAgents/${plist_basename}"
mkdir -p "${HOME}/Library/LaunchAgents"
touch "${plist_path}"

# fill in that plist file
cat <<EOF >"${plist_path}"
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

# Change permission of the program and plist file
log "Changing the permissions..."
chmod 755 "${copied_program}"
chmod 644 "${plist_path}"

highlight <<EOF && echo
Needs reboot to take effect.
To undo, run these commands.

  rm ${copied_program}
  rm ${plist_path}
EOF
