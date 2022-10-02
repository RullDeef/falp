;; Написать рекурсивную версию с именем recnth функции nth.

(defun recnth (index lst)
    (cond
        ((null lst) nil)
        ((eql index 0) (car lst))
        (t (recnth (- index 1) (cdr lst)))))
