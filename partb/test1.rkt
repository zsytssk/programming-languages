#lang racket
(provide (all-defined-out))

(define a 3)
(define b (+ a 2))

(define cube1
  (lambda (x)
    (* x (* x x))))

(define cube2
  (lambda (x)
    (* x x x)))

(define (cube3 x)
  (* x x x))

(define (pow1 x y)
  (if (= y 0) 1 ( * x (pow1 x(- y 1)))))

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

(define powTest (pow2 3))