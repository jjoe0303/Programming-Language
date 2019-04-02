(defun prime (n)
	(loop for x from 2 to (floor (sqrt n))
		do(if (eq (mod n x) 0)	(return-from prime nil)))
	(return-from prime t))

(print (prime 2))
(print (prime 239))
(print (prime 999))
(print (prime 17))
