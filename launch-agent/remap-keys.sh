#!/usr/bin/env bash

# ==========================
# Remap Right Command to F17.
# Remap Right Option to F18.
# ==========================

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E7,
      "HIDKeyboardModifierMappingDst": 0x70000006C
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E6,
      "HIDKeyboardModifierMappingDst": 0x70000006D
    }
  ]
}'
