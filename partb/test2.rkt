#lang racket

(define (sum xs)
  (if (null? xs)
      0
      (+(car xs) (sum (cdr xs)))))

(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs)) (my-map f (cdr xs)))))

(define x (cons 4 (cons 5 (cons 6 null))))

(define (fact n) (if (= n 0) 1 (* n (fact (- n 1)))))

