;; Написать рекурсивную функцию allodd, которая возвращает
;; t когда все элементы списка нечетные.

(defun allodd (lst)
    (cond
        ((null lst) t)
        ((evenp (car lst)) nil)
        (t (allodd (cdr lst)))))
