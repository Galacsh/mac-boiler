#!/usr/bin/env bash

# ==========================
# Remap Right Command to F18
# ==========================

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc":0x7000000e7,
      "HIDKeyboardModifierMappingDst":0x70000006d
    }
  ]
}'
