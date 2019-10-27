#lang racket
(define (calculate texto1 texto2 tamA tamB)
    (cond
        [(zero? tamA) tamB]
        [(zero? tamB) tamA]
        [(equal? (string-ref texto1 (- tamA 1)) (string-ref texto2 (- tamB 1))) (calculate texto1 texto2 (sub1 tamA) (sub1 tamB))]
        [else (min (add1 (calculate texto1 texto2 tamA (sub1 tamB))) (add1 (calculate texto1 texto2 (sub1 tamA) tamB)) (add1 (calculate texto1 texto2 (sub1 tamA) (sub1 tamB))))]
        )
  )

(define (levenshtein texto1 texto2)
    (define a (string-length texto1))
    (define b (string-length texto2))
    (define c (calculate texto1 texto2 a b))
    (cond
        [(< a b) (exact->inexact(/ c b))]
        [else (exact->inexact (/ c a))]
    )
)
    