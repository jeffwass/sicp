#lang planet neil/sicp
; SICP 2.43

; Louis is repeating many calculations unneccessarily by trying all remaining queens for each row.
; Specifically he is enumerating over board-size for each attempt of new-row, when building the rest-of-queens.
; For each new-row attempt, he is recalculating all previous rest-of-queens positions, which is tree-recursive.

; Expect # of calculations to scale ~ exp(T)