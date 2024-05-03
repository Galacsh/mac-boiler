#!/usr/bin/env bash

# ==========================
# Remap Fn to F16
# ==========================

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0xFF00000003,
      "HIDKeyboardModifierMappingDst": 0x70000006B
    }
  ]
}'
