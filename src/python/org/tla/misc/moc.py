#!/usr/bin/env python3

import random
import sys

kOffsets = {
    'serif_bold': 0 * 52,
    'serif_italic': 1 * 52,
    'serif_bold_italic': 2 * 52,
    'script': 3 * 52,
    'script_bold': 4 * 52,
    'fraktur': 5 * 52,
    'double_struck': 6 * 52,
    'fraktur_bold': 7 * 52,
    'sansserif': 8 * 52,
    'sansserif_bold': 9 * 52,
    'sansserif_italic': 10 * 52,
    'sansserif_bold_italic': 11 * 52,
    'monospace': 12 * 52,
    # TODO(ji): Numbers and Greek letters.
}
kFirst = 0x1d400
kLast = 0x1d800
kA = ord('A')
kZ = ord('Z')
ka = ord('a')
kz = ord('z')

offsets = [v + kFirst for v in kOffsets.values()]
cmap = dict(**{chr(i + 65): i for i in range(26)},
            **{chr(i + 97): i + 26 for i in range(26)})

print(' '.join([
    ''.join([chr(random.choice(offsets) + cmap[letter])
             if letter in cmap else letter
             for letter in word])
    for word in sys.argv[1:]]))
