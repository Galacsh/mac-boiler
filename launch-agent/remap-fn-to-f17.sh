#!/usr/bin/env bash

# ==========================
# Remap Fn to F17
# ==========================

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0xFF00000003,
      "HIDKeyboardModifierMappingDst": 0x70000006C
    }
  ]
}'
