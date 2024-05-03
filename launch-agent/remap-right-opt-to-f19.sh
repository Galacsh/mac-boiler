#!/usr/bin/env bash

# ==========================
# Remap Right Option to F19
# ==========================

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E6,
      "HIDKeyboardModifierMappingDst": 0x70000006E
    }
  ]
}'
