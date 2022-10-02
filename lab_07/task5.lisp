;; Напишите функцию select-between, которая из списка-аргумента,
;; содержащего только числа, выбирает только те, которые расположены
;; между двумя указанными границами-аргументами и возвращает их
;; в виде списка (упорядоченного по возрастанию - +2 балла).

(defun insert-sorted (elem lst)
    (cond
        ((null lst) (list elem))
        ((<= elem (car lst)) (cons elem lst))
        (t (cons (car lst) (insert-sorted elem (cdr lst))))))

(defun __select-between (lst low high res)
    (cond
        ((null lst) res)
        ((< low (car lst) high)
            (__select-between (cdr lst) low high (insert-sorted (car lst) res)))
        (t  (__select-between (cdr lst) low high res))))

(defun select-between (lst low high)
    (__select-between lst low high nil))
