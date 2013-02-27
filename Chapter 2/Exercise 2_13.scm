#lang planet neil/sicp
;SICP 2.13

; x = a +/- b where b << a
; y = c +/- d where d << c
; z = x * y
;   = ((a-b)*(c-d) , (a+b)*(c+d))
;   = (ac - (ad + bc) + bd, ac + (ad + bc) + bd)     bd is small, ignore
;   = ac +/- (ad + bc)
;   = ac * (1 +/- (b/a + d/c))