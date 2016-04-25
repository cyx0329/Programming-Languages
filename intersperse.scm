; Author: Yi Cai
; define an intersperse function takes a value and a list, and return the list 
;in which the value is "interspersed" into the given list.

(define (intersperse b xs) 
   (cond ((null? xs) xs)
         (else (cond ((null? (cdr xs)) xs)
                     (else (cons (car xs) (cons b (intersperse b (cdr xs)))))))))
 




; To load this file, type 
;   scheme
; on the command line and then type 
;   (load "intersperse.scm")
; at the Scheme prompt.