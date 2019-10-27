#lang racket
(define (calculate texto1 texto2 tamA tamB)
    (cond
        [(zero? a) b]
        [(zero? b) a]
        [(equal? (string-ref texto1 tamA) (string-ref texto2 tamB)) (calculate texto1 texto2 (sub1 tamA) (sub1 tamB))]
        [else (min (add1 (calculate texto1 texto2 tamA (sub1 tamB))) (add1 (calculate texto1 texto2 (sub1 tamA) tamB)) (add1 (calculate texto1 texto2 (sub1 tamA) (sub1 tamB))))]
    )
)

(define (levenshtein texto1 texto2)
    (let [a (string-length texto1)])
    (let [b (string-length texto2)])
    (let [c (calculate texto1 texto2 a b)])
    (cond
        [(< a b) (/ c b)]
        [(< b a) (/ c a)]
    )
)
    