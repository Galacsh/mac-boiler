#!/usr/bin/env bash

# ==========================
# Remap Right Command to F17
# ==========================

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E7,
      "HIDKeyboardModifierMappingDst": 0x70000006C
    }
  ]
}'
