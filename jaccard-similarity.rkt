#lang racket
(require racket/set)
(require rackunit)
(require rackunit/text-ui)
(require memoize)
(require memo)

(define jaccard-similarity-tests
  (test-suite
   "jaccard-similarity-tests"
   (check-equal? (jaccard-similarity "Marina" "Mateus") 0.0)
   (check-equal? (jaccard-similarity "Algoritmos são legais" "Logaritmos não são legais") 0.4)
   (check-equal? (jaccard-similarity "Let's make America great Again!" "And then Trump said : 'Let's make lorem ipsun great again!'") 0.14285714285714285)
   (check-equal? (jaccard-similarity "Mateus" "Msrolg") 0.0)
   (check-equal? (jaccard-similarity "Sou lindo" "") 0.0)))
  
(define/memo (jaccard-similarity texto1 texto2)
  (define lst0 (string-split texto1)) ;;transformação do primeiro texto em uma lista de strings
  (define lst1 (string-split texto2)) ;;transformação do segundo texto em uma lista de strings
  (define unionlst (set-union lst0 lst1)) ;;realização da união entre as duas listas
  (define intersectlst (set-intersect lst0 lst1)) ;;realização da interseçao entre as duas listas
  (exact->inexact(/ (length intersectlst) (length unionlst))) ;;calculo do valor do coeficiente de jaccard  
)

(define (executa-testes . testes)
  (run-tests (test-suite "jaccard-similarity-tests" testes))
  (void))

(executa-testes jaccard-similarity-tests)

(provide jaccard-similarity)