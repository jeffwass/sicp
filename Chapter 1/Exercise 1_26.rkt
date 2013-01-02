#lang planet neil/sicp
; By not using the square lambda, the function is needlessly calculating itself twice, including in all recursive calls,
; so there is no benefit