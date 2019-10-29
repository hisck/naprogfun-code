#lang racket
(require rackunit)
(require rackunit/text-ui)
(require memoize)
(require memo)

(define levenshtein-tests
  (test-suite
   "levenshtein-tests"
   (check-equal? (levenshtein "Mateus" "Msrolg") 0.16666666666666666)
   (check-equal? (levenshtein "Tenorio" "Marina") 0.14285714285714285)
   (check-equal? (levenshtein "Mateus" "Mateus") 1.0)
   (check-equal? (levenshtein "cxvb" "caio") 0.25)
   (check-equal? (levenshtein "" "Sou lindo") 0.0)))

(define/memo (calculate texto1 texto2 tamA tamB)
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
        [(< a b) (exact->inexact(- 1 (/ c b)))]
        [else (exact->inexact (- 1 (/ c a)))]
    )
)

(define (executa-testes . testes)
  (run-tests (test-suite "levenshtein-tests" testes))
  (void))

(executa-testes levenshtein-tests)

(provide levenshtein)