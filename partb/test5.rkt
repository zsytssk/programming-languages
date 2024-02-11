#lang racket

(define pr (cons 1 (cons #t "hi")))
(define lst (cons 1 (cons #t (cons "hi" null))))
(define mpr (mcons 1 (mcons #t "hi")))

(define (my-if-bad e1 e2 e3)
  (if e1 e2 e3))

(define (factorial-normal x)
  (if (= x 0)
      1
      (* x (factorial-normal (- x 1)))))

(define (factorial-bad x)
  (my-if-bad (= x 0)
             1
             (* x (factorial-bad (- x 1)))))

(define (slow-add x y)
  (letrec ([slow-id (lambda (y z)
                      (if (= 0 z)
                          y
                          (slow-id y (- z 1))))])
    (+ (slow-id x 500000000) y)))

(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))

(define (my-delay th)
  (mcons #f th))

(define (my-force p)
  (if (mcar p)
      (mcdr p)
      (begin (set-mcar! p #t)
             (set-mcdr! p ((mcdr p)))
             (mcdr p))))

(define (my-calc x) (my-mult x (let ([p (my-delay (lambda () (slow-add 3 4)))])
                                 (lambda () (my-force p)))))