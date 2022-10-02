;; Написать рекурсивную функцию, которая возвращает первое
;; нечетное число из списка (структурированного), возможно
;; создавая некоторые вспомогательные функции.

(defun get-first-odd (lst)
    (cond
        ((null lst) nil)
        ((and (numberp (car lst)) (oddp (car lst)))
            (car lst))
        ((listp (car lst))
            (or (get-first-odd (car lst))
                (get-first-odd (cdr lst))))
        (t (get-first-odd (cdr lst)))))
