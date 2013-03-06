#lang planet neil/sicp
; SICP 2.55

(car ''abracadabra)

; interpreted as follows
(car (quote (quote abracadabra)))

; first quote demarks the quotation, so the second one looks like a list
(quote (quote abracadabra))

; the second quote can be any other element, like 'blah'
(car (quote (blah abracadabra)))