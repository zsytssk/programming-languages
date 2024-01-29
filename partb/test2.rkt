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

; (define (sum1 xs)
;   (if (null? xs)
;       0
;       (if (number? (car xs))
;           (+ (car xs) (sum1 (cdr xs)))
;           (+ (sum1 (car xs)) (sum1 (cdr xs))))))
(define (sum1 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))
          (+ (sum1 (car xs)) (sum1 (cdr xs))))))

(define xs '(1 2 3 4))
(define ys '((1 2) 2 3 4))
(define ts (list (list 1 2) (list 2 3) (list 3 4)))
(define zs (list #f "hi" 14))