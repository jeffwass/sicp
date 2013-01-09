#lang planet neil/sicp
;SICP 2.09
; x = (a b)
; y = (c d)
; z = x + y = (a+c b+d)
; (width x) = (b-a)/2
; (width y) = (d-c)/2
; (width z) = (b+d -(a+c))/2
;           = ((b-a) + (d-c))/2
; w = x*y where x<y and both positive
; w = (a*c b*d)
; (width w) = (b*d - a*c)/2
; depends on more than just width of x,y
