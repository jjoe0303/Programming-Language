;;;file : fib.lsp

(DEFUN fib1(n)
  (IF (< n 2)
    n
   (+  (fib1 (- n 1)) (fib1 (- n 2)))
  )
)


(DEFUN tailfib(n sum tmp1 tmp2 firsti)
	(cond 
		((< n 2) 
			(if (eq firsti 1)	n sum))
		(t 
			(tailfib (- n 1) (+ tmp1 tmp2) tmp2 (+ tmp1 tmp2) 0))))

(DEFUN fib2(n)
	(tailfib n 0 0 1 1))

;(print (fib2 0))
;(print (fib2 1))
;(print (fib2 2))
;(print (fib2 3))
;(print (fib2 4))
;(print (fib2 5))
;(print (fib2 6))
;(print (fib2 7))
;(print (fib2 8))
