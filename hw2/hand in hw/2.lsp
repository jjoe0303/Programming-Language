(defun mergelist(lista listb);
(cond ((null lista) listb)
						((null listb) lista)
						((< (car lista) (car listb)) (cons (car lista) (mergelist (cdr lista) listb)))
						(t (cons (car listb) (mergelist lista (cdr listb))))))

(defun mergesort(numbers)
	(if (= (length numbers) 1)
	numbers
	(mergelist (mergesort (subseq numbers 0 (truncate (/ (length numbers) 2))))    
						(mergesort (subseq numbers (truncate (/ (length numbers) 2)))))))
;	(print (subseq numbers 0 (truncate (/ (length numbers) 2))))
;	(print (subseq numbers (truncate (/ (length numbers) 2)))))
;	(return-from mergesort numbers))



;main function
(let ((n (read))
				(numbers))
	(setf numbers
		(do ((i 0 (+ i 1))
					(tmp nil))
			((>= i n)
				(reverse tmp))	
			(setf tmp (cons (read) tmp ))))
	(format t "~{~A ~}~%" (mergesort numbers)))
	;(	print numbers))
