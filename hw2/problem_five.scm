;; Programming Languages Homework 2
;; Question 5: Scheme
;; Alex Pine

;; Question 5.1: foldr
(define (foldr f s L)
  (if (null? (cdr L))
      (f s (car L))
      (f (foldr f s (cdr L)) (car L))))


;; Question 5.2: paramreverse
(define (paramreverse f AL)
  (letrec
      ((reverse (lambda (l)
		  (if (null? l)
		      '()
		      (append (reverse (cdr l)) (list (car l)))))))
    (apply f (reverse AL))))


;; Question 5.3: highest

;; Helper function that finds the maximum value in a list.
(define (max_value_helper L best)
  (cond
   ((null? L)
    best)
   ((or (null? best) (> (car L) best))
    (max_value_helper (cdr L) (car L)))
   (else
    (max_value_helper (cdr L) best))))

;; Helper function that removes all occurances of a value from a list.
(define (remove_value_helper value L output_list)
  (cond
   ((null? L)
    output_list)
   ((= (car L) value)
    (remove_value_helper value (cdr L) output_list))
   (else
    (remove_value_helper value (cdr L) (append output_list (list (car L)))))))

; Helper function. Same as highest but with an extra parameter.
(define (highest_helper L k highest_list)
  (if (<= k 0)
      highest_list
      (let*
	  ((best (max_value_helper L '()))
	   (updated_L (remove_value_helper best L '())))
	(highest_helper updated_L (- k 1) (cons best highest_list)))))

; highest function.
(define (highest L k)
  (highest_helper L k '()))


;; Question 4: mapfun

; Helper function. Same as mapfun but with an extra parameter.
(define (mapfun_helper func_list args_list output_list)
  (if (or (null? func_list) (null? args_list))
      output_list
      (let ((value ((car func_list) (car args_list))))
	(mapfun_helper (cdr func_list) (cdr args_list)
		       (append output_list (list value))))))

; mapfun function.
(define (mapfun FL L)
  (mapfun_helper FL L '()))


;; Question 5: filter
(define (filter pred L)
  (cond
   ((null? L)
    '())
   ((pred (car L))
    (cons (car L) (filter pred (cdr L))))
   (else
    (filter pred (cdr L)))))
