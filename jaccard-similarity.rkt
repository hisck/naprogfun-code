#lang racket
(require racket/set)

(define (jaccard-similarity texto1 texto2)
    (let [lst0 (string-split text01)])
    (let [lst1 (string-split texto2)])
    (let [unionlst (set-union lst0 lst1)])
    (let [intersectlst (set-intersect lst0 lst1)])
    (/ (lenght intersectlst) (lenght unionlst))
)