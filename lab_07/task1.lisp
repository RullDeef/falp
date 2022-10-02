;; Написать хвостовую рекурсивную функцию my-reverse, которая
;; развернет верхний уровень своего списка-аргумента lst.

(defun __my-reverse (lst res)
    (if (null lst)
        res
        (__my-reverse
            (cdr lst)
            (cons (car lst) res))))

(defun my-reverse (lst)
    (__my-reverse lst nil))
