#lang racket
(require racket/set)

(define (jaccard-similarity texto1 texto2)
  (define lst0 (string-split texto1))
  (define lst1 (string-split texto2))
  (define unionlst (set-union lst0 lst1))
  (define intersectlst (set-intersect lst0 lst1))
  (/ (length intersectlst) (length unionlst))
)