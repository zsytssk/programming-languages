#lang racket

(define (number-until stream tester)
  (letrec ([f (lambda (stream ans)
                (let ([pr (stream)])
                  (if (tester (car pr))
                      ans
                      (f (cdr pr) (+ ans 1))
                      )))])
    (f stream 1)
    ))

(define ones (lambda () (cons 1 ones)))
(define (f x) (cons x (lambda () (f (+ x 1)))))
(define nats (lambda () (f 1)))

(define nats1 (letrec ([f (lambda (x) (cons x (lambda() (f (+ x 1)))))])
                (lambda() (f 1))))

(define powers-of-two (letrec ([f (lambda (x) (cons x (lambda() (f (* x 2)))))])
                        (lambda() (f 1))))


(define )