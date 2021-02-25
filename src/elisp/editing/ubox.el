;; TODO(ji): Finish the job and assign the split-thickness characters.

;; TODO(ji): Figure out how to detect the state of NumLock so as to double
;;           the number of possible assignments. As it is, the NumLock 
;;           merely flips the function of the Shift key.

; Light and heavy solid lines
;
; 2500 ─ BOX DRAWINGS LIGHT HORIZONTAL
; 2501 ━ BOX DRAWINGS HEAVY HORIZONTAL
; 2502 │ BOX DRAWINGS LIGHT VERTICAL
; 2503 ┃ BOX DRAWINGS HEAVY VERTICAL
; 
; Light and heavy dashed lines
; 
; 2504 ┄ BOX DRAWINGS LIGHT TRIPLE DASH HORIZONTAL
; 2505 ┅ BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL
; 2506 ┆ BOX DRAWINGS LIGHT TRIPLE DASH VERTICAL
; 2507 ┇ BOX DRAWINGS HEAVY TRIPLE DASH VERTICAL
; 2508 ┈ BOX DRAWINGS LIGHT QUADRUPLE DASH HORIZONTAL
; 2509 ┉ BOX DRAWINGS HEAVY QUADRUPLE DASH HORIZONTAL
; 250A ┊ BOX DRAWINGS LIGHT QUADRUPLE DASH VERTICAL
; 250B ┋ BOX DRAWINGS HEAVY QUADRUPLE DASH VERTICAL
; 
; Light and heavy line box components
;
; 250C ┌ BOX DRAWINGS LIGHT DOWN AND RIGHT
; 250D ┍ BOX DRAWINGS DOWN LIGHT AND RIGHT HEAVY
; 250E ┎ BOX DRAWINGS DOWN HEAVY AND RIGHT LIGHT
; 250F ┏ BOX DRAWINGS HEAVY DOWN AND RIGHT
; 2510 ┐ BOX DRAWINGS LIGHT DOWN AND LEFT
; 2511 ┑ BOX DRAWINGS DOWN LIGHT AND LEFT HEAVY
; 2512 ┒ BOX DRAWINGS DOWN HEAVY AND LEFT LIGHT
; 2513 ┓ BOX DRAWINGS HEAVY DOWN AND LEFT
; 2514 └ BOX DRAWINGS LIGHT UP AND RIGHT
; 2515 ┕ BOX DRAWINGS UP LIGHT AND RIGHT HEAVY
; 2516 ┖ BOX DRAWINGS UP HEAVY AND RIGHT LIGHT
; 2517 ┗ BOX DRAWINGS HEAVY UP AND RIGHT
; 2518 ┘ BOX DRAWINGS LIGHT UP AND LEFT
; 2519 ┙ BOX DRAWINGS UP LIGHT AND LEFT HEAVY
; 251A ┚ BOX DRAWINGS UP HEAVY AND LEFT LIGHT
; 251B ┛ BOX DRAWINGS HEAVY UP AND LEFT
; 251C ├ BOX DRAWINGS LIGHT VERTICAL AND RIGHT
; 251D ┝ BOX DRAWINGS VERTICAL LIGHT AND RIGHT HEAVY
; 251E ┞ BOX DRAWINGS UP HEAVY AND RIGHT DOWN LIGHT
; 251F ┟ BOX DRAWINGS DOWN HEAVY AND RIGHT UP LIGHT
; 2520 ┠ BOX DRAWINGS VERTICAL HEAVY AND RIGHT LIGHT
; 2521 ┡ BOX DRAWINGS DOWN LIGHT AND RIGHT UP HEAVY
; 2522 ┢ BOX DRAWINGS UP LIGHT AND RIGHT DOWN HEAVY
; 2523 ┣ BOX DRAWINGS HEAVY VERTICAL AND RIGHT
; 2524 ┤ BOX DRAWINGS LIGHT VERTICAL AND LEFT
; 2525 ┥ BOX DRAWINGS VERTICAL LIGHT AND LEFT HEAVY
; 2526 ┦ BOX DRAWINGS UP HEAVY AND LEFT DOWN LIGHT
; 2527 ┧ BOX DRAWINGS DOWN HEAVY AND LEFT UP LIGHT
; 2528 ┨ BOX DRAWINGS VERTICAL HEAVY AND LEFT LIGHT
; 2529 ┩ BOX DRAWINGS DOWN LIGHT AND LEFT UP HEAVY
; 252A ┪ BOX DRAWINGS UP LIGHT AND LEFT DOWN HEAVY
; 252B ┫ BOX DRAWINGS HEAVY VERTICAL AND LEFT
; 252C ┬ BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
; 252D ┭ BOX DRAWINGS LEFT HEAVY AND RIGHT DOWN LIGHT
; 252E ┮ BOX DRAWINGS RIGHT HEAVY AND LEFT DOWN LIGHT
; 252F ┯ BOX DRAWINGS DOWN LIGHT AND HORIZONTAL HEAVY
; 2530 ┰ BOX DRAWINGS DOWN HEAVY AND HORIZONTAL LIGHT
; 2531 ┱ BOX DRAWINGS RIGHT LIGHT AND LEFT DOWN HEAVY
; 2532 ┲ BOX DRAWINGS LEFT LIGHT AND RIGHT DOWN HEAVY
; 2533 ┳ BOX DRAWINGS HEAVY DOWN AND HORIZONTAL
; 2534 ┴ BOX DRAWINGS LIGHT UP AND HORIZONTAL
; 2535 ┵ BOX DRAWINGS LEFT HEAVY AND RIGHT UP LIGHT
; 2536 ┶ BOX DRAWINGS RIGHT HEAVY AND LEFT UP LIGHT
; 2537 ┷ BOX DRAWINGS UP LIGHT AND HORIZONTAL HEAVY
; 2538 ┸ BOX DRAWINGS UP HEAVY AND HORIZONTAL LIGHT
; 2539 ┹ BOX DRAWINGS RIGHT LIGHT AND LEFT UP HEAVY
; 253A ┺ BOX DRAWINGS LEFT LIGHT AND RIGHT UP HEAVY
; 253B ┻ BOX DRAWINGS HEAVY UP AND HORIZONTAL
; 253C ┼ BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
; 253D ┽ BOX DRAWINGS LEFT HEAVY AND RIGHT VERTICAL LIGHT
; 253E ┾ BOX DRAWINGS RIGHT HEAVY AND LEFT VERTICAL LIGHT
; 253F ┿ BOX DRAWINGS VERTICAL LIGHT AND HORIZONTAL HEAVY
; 2540 ╀ BOX DRAWINGS UP HEAVY AND DOWN HORIZONTAL LIGHT
; 2541 ╁ BOX DRAWINGS DOWN HEAVY AND UP HORIZONTAL LIGHT
; 2542 ╂ BOX DRAWINGS VERTICAL HEAVY AND HORIZONTAL LIGHT
; 2543 ╃ BOX DRAWINGS LEFT UP HEAVY AND RIGHT DOWN LIGHT
; 2544 ╄ BOX DRAWINGS RIGHT UP HEAVY AND LEFT DOWN LIGHT
; 2545 ╅ BOX DRAWINGS LEFT DOWN HEAVY AND RIGHT UP LIGHT
; 2546 ╆ BOX DRAWINGS RIGHT DOWN HEAVY AND LEFT UP LIGHT
; 2547 ╇ BOX DRAWINGS DOWN LIGHT AND UP HORIZONTAL HEAVY
; 2548 ╈ BOX DRAWINGS UP LIGHT AND DOWN HORIZONTAL HEAVY
; 2549 ╉ BOX DRAWINGS RIGHT LIGHT AND LEFT VERTICAL HEAVY
; 254A ╊ BOX DRAWINGS LEFT LIGHT AND RIGHT VERTICAL HEAVY
; 254B ╋ BOX DRAWINGS HEAVY VERTICAL AND HORIZONTAL
; 
; Light and heavy dashed lines
; 
; 254C ╌ BOX DRAWINGS LIGHT DOUBLE DASH HORIZONTAL
; 254D ╍ BOX DRAWINGS HEAVY DOUBLE DASH HORIZONTAL
; 254E ╎ BOX DRAWINGS LIGHT DOUBLE DASH VERTICAL
; 254F ╏ BOX DRAWINGS HEAVY DOUBLE DASH VERTICAL
; 
; Double lines
; 
; 2550 ═ BOX DRAWINGS DOUBLE HORIZONTAL
; 2551 ║ BOX DRAWINGS DOUBLE VERTICAL
; 
; Light and double line box components
; 
; 2552 ╒ BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE
; 2553 ╓ BOX DRAWINGS DOWN DOUBLE AND RIGHT SINGLE
; 2554 ╔ BOX DRAWINGS DOUBLE DOWN AND RIGHT
; 2555 ╕ BOX DRAWINGS DOWN SINGLE AND LEFT DOUBLE
; 2556 ╖ BOX DRAWINGS DOWN DOUBLE AND LEFT SINGLE
; 2557 ╗ BOX DRAWINGS DOUBLE DOWN AND LEFT
; 2558 ╘ BOX DRAWINGS UP SINGLE AND RIGHT DOUBLE
; 2559 ╙ BOX DRAWINGS UP DOUBLE AND RIGHT SINGLE
; 255A ╚ BOX DRAWINGS DOUBLE UP AND RIGHT
; 255B ╛ BOX DRAWINGS UP SINGLE AND LEFT DOUBLE
; 255C ╜ BOX DRAWINGS UP DOUBLE AND LEFT SINGLE
; 255D ╝ BOX DRAWINGS DOUBLE UP AND LEFT
; 255E ╞ BOX DRAWINGS VERTICAL SINGLE AND RIGHT DOUBLE
; 255F ╟ BOX DRAWINGS VERTICAL DOUBLE AND RIGHT SINGLE
; 2560 ╠ BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
; 2561 ╡ BOX DRAWINGS VERTICAL SINGLE AND LEFT DOUBLE
; 2562 ╢ BOX DRAWINGS VERTICAL DOUBLE AND LEFT SINGLE
; 2563 ╣ BOX DRAWINGS DOUBLE VERTICAL AND LEFT
; 2564 ╤ BOX DRAWINGS DOWN SINGLE AND HORIZONTAL DOUBLE
; 2565 ╥ BOX DRAWINGS DOWN DOUBLE AND HORIZONTAL SINGLE
; 2566 ╦ BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
; 2567 ╧ BOX DRAWINGS UP SINGLE AND HORIZONTAL DOUBLE
; 2568 ╨ BOX DRAWINGS UP DOUBLE AND HORIZONTAL SINGLE
; 2569 ╩ BOX DRAWINGS DOUBLE UP AND HORIZONTAL
; 256A ╪ BOX DRAWINGS VERTICAL SINGLE AND HORIZONTAL DOUBLE
; 256B ╫ BOX DRAWINGS VERTICAL DOUBLE AND HORIZONTAL SINGLE
; 256C ╬ BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
; 
; Character cell arcs
; 
; 256D ╭ BOX DRAWINGS LIGHT ARC DOWN AND RIGHT
; 256E ╮ BOX DRAWINGS LIGHT ARC DOWN AND LEFT
; 256F ╯ BOX DRAWINGS LIGHT ARC UP AND LEFT
; 2570 ╰ BOX DRAWINGS LIGHT ARC UP AND RIGHT
; 
; Character cell diagonals
; 
; 2571 ╱ BOX DRAWINGS LIGHT DIAGONAL UPPER RIGHT TO LOWER LEFT
; 2572 ╲ BOX DRAWINGS LIGHT DIAGONAL UPPER LEFT TO LOWER RIGHT
; 2573 ╳ BOX DRAWINGS LIGHT DIAGONAL CROSS
; 
; Light and heavy half lines
; 
; 2574 ╴ BOX DRAWINGS LIGHT LEFT
; 2575 ╵ BOX DRAWINGS LIGHT UP
; 2576 ╶ BOX DRAWINGS LIGHT RIGHT
; 2577 ╷ BOX DRAWINGS LIGHT DOWN
; 2578 ╸ BOX DRAWINGS HEAVY LEFT
; 2579 ╹ BOX DRAWINGS HEAVY UP
; 257A ╺ BOX DRAWINGS HEAVY RIGHT
; 257B ╻ BOX DRAWINGS HEAVY DOWN
; 
; Mixed light and heavy lines
; 
; 257C ╼ BOX DRAWINGS LIGHT LEFT AND HEAVY RIGHT
; 257D ╽ BOX DRAWINGS LIGHT UP AND HEAVY DOWN
; 257E ╾ BOX DRAWINGS HEAVY LEFT AND LIGHT RIGHT
; 257F ╿ BOX DRAWINGS HEAVY UP AND LIGHT DOWN

(defconst bd-light-horizontal "\u2500") ; ─ 
(defconst bd-heavy-horizontal "\u2501") ; ━ 
(defconst bd-light-vertical "\u2502") ; │ 
(defconst bd-heavy-vertical "\u2503") ; ┃ 
(defconst bd-light-triple-dash-horizontal "\u2504") ; ┄ 
(defconst bd-heavy-triple-dash-horizontal "\u2505") ; ┅ 
(defconst bd-light-triple-dash-vertical "\u2506") ; ┆ 
(defconst bd-heavy-triple-dash-vertical "\u2507") ; ┇ 
(defconst bd-light-quadruple-dash-horizontal "\u2508") ; ┈ 
(defconst bd-heavy-quadruple-dash-horizontal "\u2509") ; ┉ 
(defconst bd-light-quadruple-dash-vertical "\u250A") ; ┊ 
(defconst bd-heavy-quadruple-dash-vertical "\u250B") ; ┋ 
(defconst bd-light-down-and-right "\u250C") ; ┌ 
(defconst bd-down-light-and-right-heavy "\u250D") ; ┍ 
(defconst bd-down-heavy-and-right-light "\u250E") ; ┎ 
(defconst bd-heavy-down-and-right "\u250F") ; ┏ 
(defconst bd-light-down-and-left "\u2510") ; ┐ 
(defconst bd-down-light-and-left-heavy "\u2511") ; ┑ 
(defconst bd-down-heavy-and-left-light "\u2512") ; ┒ 
(defconst bd-heavy-down-and-left "\u2513") ; ┓ 
(defconst bd-light-up-and-right "\u2514") ; └ 
(defconst bd-up-light-and-right-heavy "\u2515") ; ┕ 
(defconst bd-up-heavy-and-right-light "\u2516") ; ┖ 
(defconst bd-heavy-up-and-right "\u2517") ; ┗ 
(defconst bd-light-up-and-left "\u2518") ; ┘ 
(defconst bd-up-light-and-left-heavy "\u2519") ; ┙ 
(defconst bd-up-heavy-and-left-light "\u251A") ; ┚ 
(defconst bd-heavy-up-and-left "\u251B") ; ┛ 
(defconst bd-light-vertical-and-right "\u251C") ; ├ 
(defconst bd-vertical-light-and-right-heavy "\u251D") ; ┝ 
(defconst bd-up-heavy-and-right-down-light "\u251E") ; ┞ 
(defconst bd-down-heavy-and-right-up-light "\u251F") ; ┟ 
(defconst bd-vertical-heavy-and-right-light "\u2520") ; ┠ 
(defconst bd-down-light-and-right-up-heavy "\u2521") ; ┡ 
(defconst bd-up-light-and-right-down-heavy "\u2522") ; ┢ 
(defconst bd-heavy-vertical-and-right "\u2523") ; ┣ 
(defconst bd-light-vertical-and-left "\u2524") ; ┤ 
(defconst bd-vertical-light-and-left-heavy "\u2525") ; ┥ 
(defconst bd-up-heavy-and-left-down-light "\u2526") ; ┦ 
(defconst bd-down-heavy-and-left-up-light "\u2527") ; ┧ 
(defconst bd-vertical-heavy-and-left-light "\u2528") ; ┨ 
(defconst bd-down-light-and-left-up-heavy "\u2529") ; ┩ 
(defconst bd-up-light-and-left-down-heavy "\u252A") ; ┪ 
(defconst bd-heavy-vertical-and-left "\u252B") ; ┫ 
(defconst bd-light-down-and-horizontal "\u252C") ; ┬ 
(defconst bd-left-heavy-and-right-down-light "\u252D") ; ┭ 
(defconst bd-right-heavy-and-left-down-light "\u252E") ; ┮ 
(defconst bd-down-light-and-horizontal-heavy "\u252F") ; ┯ 
(defconst bd-down-heavy-and-horizontal-light "\u2530") ; ┰ 
(defconst bd-right-light-and-left-down-heavy "\u2531") ; ┱ 
(defconst bd-left-light-and-right-down-heavy "\u2532") ; ┲ 
(defconst bd-heavy-down-and-horizontal "\u2533") ; ┳ 
(defconst bd-light-up-and-horizontal "\u2534") ; ┴ 
(defconst bd-left-heavy-and-right-up-light "\u2535") ; ┵ 
(defconst bd-right-heavy-and-left-up-light "\u2536") ; ┶ 
(defconst bd-up-light-and-horizontal-heavy "\u2537") ; ┷ 
(defconst bd-up-heavy-and-horizontal-light "\u2538") ; ┸ 
(defconst bd-right-light-and-left-up-heavy "\u2539") ; ┹ 
(defconst bd-left-light-and-right-up-heavy "\u253A") ; ┺ 
(defconst bd-heavy-up-and-horizontal "\u253B") ; ┻ 
(defconst bd-light-vertical-and-horizontal "\u253C") ; ┼ 
(defconst bd-left-heavy-and-right-vertical-light "\u253D") ; ┽ 
(defconst bd-right-heavy-and-left-vertical-light "\u253E") ; ┾ 
(defconst bd-vertical-light-and-horizontal-heavy "\u253F") ; ┿ 
(defconst bd-up-heavy-and-down-horizontal-light "\u2540") ; ╀ 
(defconst bd-down-heavy-and-up-horizontal-light "\u2541") ; ╁ 
(defconst bd-vertical-heavy-and-horizontal-light "\u2542") ; ╂ 
(defconst bd-left-up-heavy-and-right-down-light "\u2543") ; ╃ 
(defconst bd-right-up-heavy-and-left-down-light "\u2544") ; ╄ 
(defconst bd-left-down-heavy-and-right-up-light "\u2545") ; ╅ 
(defconst bd-right-down-heavy-and-left-up-light "\u2546") ; ╆ 
(defconst bd-down-light-and-up-horizontal-heavy "\u2547") ; ╇ 
(defconst bd-up-light-and-down-horizontal-heavy "\u2548") ; ╈ 
(defconst bd-right-light-and-left-vertical-heavy "\u2549") ; ╉ 
(defconst bd-left-light-and-right-vertical-heavy "\u254A") ; ╊ 
(defconst bd-heavy-vertical-and-horizontal "\u254B") ; ╋ 
(defconst bd-light-double-dash-horizontal "\u254C") ; ╌ 
(defconst bd-heavy-double-dash-horizontal "\u254D") ; ╍ 
(defconst bd-light-double-dash-vertical "\u254E") ; ╎ 
(defconst bd-heavy-double-dash-vertical "\u254F") ; ╏ 
(defconst bd-double-horizontal "\u2550") ; ═ 
(defconst bd-double-vertical "\u2551") ; ║ 
(defconst bd-down-single-and-right-double "\u2552") ; ╒ 
(defconst bd-down-double-and-right-single "\u2553") ; ╓ 
(defconst bd-double-down-and-right "\u2554") ; ╔ 
(defconst bd-down-single-and-left-double "\u2555") ; ╕ 
(defconst bd-down-double-and-left-single "\u2556") ; ╖ 
(defconst bd-double-down-and-left "\u2557") ; ╗ 
(defconst bd-up-single-and-right-double "\u2558") ; ╘ 
(defconst bd-up-double-and-right-single "\u2559") ; ╙ 
(defconst bd-double-up-and-right "\u255A") ; ╚ 
(defconst bd-up-single-and-left-double "\u255B") ; ╛ 
(defconst bd-up-double-and-left-single "\u255C") ; ╜ 
(defconst bd-double-up-and-left "\u255D") ; ╝ 
(defconst bd-vertical-single-and-right-double "\u255E") ; ╞ 
(defconst bd-vertical-double-and-right-single "\u255F") ; ╟ 
(defconst bd-double-vertical-and-right "\u2560") ; ╠ 
(defconst bd-vertical-single-and-left-double "\u2561") ; ╡ 
(defconst bd-vertical-double-and-left-single "\u2562") ; ╢ 
(defconst bd-double-vertical-and-left "\u2563") ; ╣ 
(defconst bd-down-single-and-horizontal-double "\u2564") ; ╤ 
(defconst bd-down-double-and-horizontal-single "\u2565") ; ╥ 
(defconst bd-double-down-and-horizontal "\u2566") ; ╦ 
(defconst bd-up-single-and-horizontal-double "\u2567") ; ╧ 
(defconst bd-up-double-and-horizontal-single "\u2568") ; ╨ 
(defconst bd-double-up-and-horizontal "\u2569") ; ╩ 
(defconst bd-vertical-single-and-horizontal-double "\u256A") ; ╪ 
(defconst bd-vertical-double-and-horizontal-single "\u256B") ; ╫ 
(defconst bd-double-vertical-and-horizontal "\u256C") ; ╬ 
(defconst bd-light-arc-down-and-right "\u256D") ; ╭ 
(defconst bd-light-arc-down-and-left "\u256E") ; ╮ 
(defconst bd-light-arc-up-and-left "\u256F") ; ╯ 
(defconst bd-light-arc-up-and-right "\u2570") ; ╰ 
(defconst bd-light-diagonal-upper-right-to-lower-left "\u2571") ; ╱ 
(defconst bd-light-diagonal-upper-left-to-lower-right "\u2572") ; ╲ 
(defconst bd-light-diagonal-cross "\u2573") ; ╳ 
(defconst bd-light-left "\u2574") ; ╴ 
(defconst bd-light-up "\u2575") ; ╵ 
(defconst bd-light-right "\u2576") ; ╶ 
(defconst bd-light-down "\u2577") ; ╷ 
(defconst bd-heavy-left "\u2578") ; ╸ 
(defconst bd-heavy-up "\u2579") ; ╹ 
(defconst bd-heavy-right "\u257A") ; ╺ 
(defconst bd-heavy-down "\u257B") ; ╻ 
(defconst bd-light-left-and-heavy-right "\u257C") ; ╼ 
(defconst bd-light-up-and-heavy-down "\u257D") ; ╽ 
(defconst bd-heavy-left-and-light-right "\u257E") ; ╾ 
(defconst bd-heavy-up-and-light-down "\u257F") ; ╿ 

;;;
;;; ┏━━━━━━━━┳━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┯━━━┓
;;; ┃        ┃ 0 │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ A │ B │ C │ D │ E │ F ┃
;;; ┣━━━━━━━━╋━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┿━━━┫
;;; ┃ U+250x ┃ ─ │ ━ │ │ │ ┃ │ ┄ │ ┅ │ ┆ │ ┇ │ ┈ │ ┉ │ ┊ │ ┋ │ ┌ │ ┍ │ ┎ │ ┏ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+251x ┃ ┐ │ ┑ │ ┒ │ ┓ │ └ │ ┕ │ ┖ │ ┗ │ ┘ │ ┙ │ ┚ │ ┛ │ ├ │ ┝ │ ┞ │ ┟ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+252x ┃ ┠ │ ┡ │ ┢ │ ┣ │ ┤ │ ┥ │ ┦ │ ┧ │ ┨ │ ┩ │ ┪ │ ┫ │ ┬ │ ┭ │ ┮ │ ┯ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+253x ┃ ┰ │ ┱ │ ┲ │ ┳ │ ┴ │ ┵ │ ┶ │ ┷ │ ┸ │ ┹ │ ┺ │ ┻ │ ┼ │ ┽ │ ┾ │ ┿ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+254x ┃ ╀ │ ╁ │ ╂ │ ╃ │ ╄ │ ╅ │ ╆ │ ╇ │ ╈ │ ╉ │ ╊ │ ╋ │ ╌ │ ╍ │ ╎ │ ╏ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+255x ┃ ═ │ ║ │ ╒ │ ╓ │ ╔ │ ╕ │ ╖ │ ╗ │ ╘ │ ╙ │ ╚ │ ╛ │ ╜ │ ╝ │ ╞ │ ╟ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+256x ┃ ╠ │ ╡ │ ╢ │ ╣ │ ╤ │ ╥ │ ╦ │ ╧ │ ╨ │ ╩ │ ╪ │ ╫ │ ╬ │ ╭ │ ╮ │ ╯ ┃
;;; ┠────────╂───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┼───┨
;;; ┃ U+257x ┃ ╰ │ ╱ │ ╲ │ ╳ │ ╴ │ ╵ │ ╶ │ ╷ │ ╸ │ ╹ │ ╺ │ ╻ │ ╼ │ ╽ │ ╾ │ ╿ ┃
;;; ┗━━━━━━━━┻━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┷━━━┛

(global-set-key (kbd "<kp-home>")         bd-light-down-and-right)
(global-set-key (kbd "<kp-up>")           bd-light-down-and-horizontal)
(global-set-key (kbd "<kp-prior>")        bd-light-down-and-left)
(global-set-key (kbd "<kp-left>")         bd-light-vertical-and-right)
(global-set-key (kbd "<kp-begin>")        bd-light-vertical)
(global-set-key (kbd "<kp-right>")        bd-light-vertical-and-left)
(global-set-key (kbd "<kp-end>")          bd-light-up-and-right)
(global-set-key (kbd "<kp-down>")         bd-light-up-and-horizontal)
(global-set-key (kbd "<kp-next>")         bd-light-up-and-left)
(global-set-key (kbd "<kp-add>")          bd-light-vertical-and-horizontal)
(global-set-key (kbd "<kp-subtract>")     bd-light-horizontal)

(global-set-key (kbd "C-<kp-home>")       bd-down-light-and-right-heavy)
(global-set-key (kbd "C-<kp-up>")         bd-down-light-and-horizontal-heavy)
(global-set-key (kbd "C-<kp-prior>")      bd-down-light-and-left-heavy)
(global-set-key (kbd "C-<kp-left>")       bd-vertical-light-and-right-heavy)
(global-set-key (kbd "C-<kp-begin>")      bd-light-vertical)
(global-set-key (kbd "C-<kp-right>")      bd-vertical-light-and-left-heavy)
(global-set-key (kbd "C-<kp-end>")        bd-up-light-and-right-heavy)
(global-set-key (kbd "C-<kp-down>")       bd-up-light-and-horizontal-heavy)
(global-set-key (kbd "C-<kp-next>")       bd-up-light-and-left-heavy)
(global-set-key (kbd "C-<kp-add>")        bd-vertical-light-and-horizontal-heavy)
(global-set-key (kbd "C-<kp-subtract>")   bd-heavy-horizontal)

(global-set-key (kbd "C-S-<kp-7>")        bd-heavy-down-and-right)
(global-set-key (kbd "C-S-<kp-8>")        bd-heavy-down-and-horizontal)
(global-set-key (kbd "C-S-<kp-9>")        bd-heavy-down-and-left)
(global-set-key (kbd "C-S-<kp-4>")        bd-heavy-vertical-and-right)
(global-set-key (kbd "C-S-<kp-5>")        bd-heavy-vertical)
(global-set-key (kbd "C-S-<kp-6>")        bd-heavy-vertical-and-left)
(global-set-key (kbd "C-S-<kp-1>")        bd-heavy-up-and-right)
(global-set-key (kbd "C-S-<kp-2>")        bd-heavy-up-and-horizontal)
(global-set-key (kbd "C-S-<kp-3>")        bd-heavy-up-and-left)
(global-set-key (kbd "C-S-<kp-add>")      bd-heavy-vertical-and-horizontal)
(global-set-key (kbd "C-S-<kp-subtract>") bd-heavy-horizontal)

(global-set-key (kbd "S-<kp-7>")          bd-down-heavy-and-right-light)
(global-set-key (kbd "S-<kp-8>")          bd-down-heavy-and-horizontal-light)
(global-set-key (kbd "S-<kp-9>")          bd-down-heavy-and-left-light)
(global-set-key (kbd "S-<kp-4>")          bd-vertical-heavy-and-right-light)
(global-set-key (kbd "S-<kp-5>")          bd-heavy-vertical)
(global-set-key (kbd "S-<kp-6>")          bd-vertical-heavy-and-left-light)
(global-set-key (kbd "S-<kp-1>")          bd-up-heavy-and-right-light)
(global-set-key (kbd "S-<kp-2>")          bd-up-heavy-and-horizontal-light)
(global-set-key (kbd "S-<kp-3>")          bd-up-heavy-and-left-light)
(global-set-key (kbd "S-<kp-add>")        bd-vertical-heavy-and-horizontal-light)
(global-set-key (kbd "S-<kp-subtract>")   bd-light-horizontal)
