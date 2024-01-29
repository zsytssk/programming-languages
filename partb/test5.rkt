#lang racket

(define pr (cons 1 (cons #t "hi")))
(define lst (cons 1 (cons #t (cons "hi" null))))
(define mpr (mcons 1 (mcons #t "hi")))