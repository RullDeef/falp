;; Написать функцию, которая возвращает первый элемент
;; списка-аргумента, который сам является непустым списком.

(defun get-first-list (lst)
    (cond ((null lst) nil)
        ((and (listp (car lst)) (not (null (car lst))))
            (car lst))
        (t (get-first-list (cdr lst)))))
