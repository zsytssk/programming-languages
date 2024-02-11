#lang racket

(struct const (int) #:transparent)
(struct add (e1 d2) #:transparent)

(define a (const 10))
(define b (add (const 10) (const 11)))