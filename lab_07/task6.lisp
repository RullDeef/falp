;; Написать рекурсивную версию (с именем rec-add)
;; вычисления суммы чисел заданного списка:
;;  a) одноуровнего смешанного,
;;	b) структурированного.

(defun __rec-add-a (lst sum)
    (cond
        ((null lst) sum)
        ((numberp (car lst))
            (__rec-add-a (cdr lst) (+ sum (car lst))))
        (t (__rec-add-a (cdr lst) sum))))

(defun rec-add-a (lst)
    (__rec-add-a lst 0))

(defun __rec-add-b (lst sum)
    (cond
        ((null lst) sum)
        ((numberp (car lst))
            (__rec-add-b (cdr lst) (+ sum (car lst))))
        ((listp (car lst))
            (__rec-add-b (cdr lst) (+ sum (rec-add-b (car lst)))))
        (t (__rec-add-b (cdr lst) sum))))

(defun rec-add-b (lst)
    (__rec-add-b lst 0))
