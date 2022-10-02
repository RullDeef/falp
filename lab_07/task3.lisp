;; Написать функцию, которая выбирает из заданного списка
;; только те числа, которые больше 1 и меньше 10.
;; (Вариант: между двумя заданными границами).


(defun select-between-3 (lst low high)
    (cond
        ((null lst) nil)
        ((< low (car lst) high)
            (cons (car lst) (select-between-3 (cdr lst) low high)))
        (t (select-between-3 (cdr lst) low high))))
