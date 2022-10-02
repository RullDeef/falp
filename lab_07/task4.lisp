;; Напишите рекурсивную функцию, которая умножает на заданное
;; число-аргумент все числа из заданного списка-аргумента, когда
;;	a) все элементы списка -- числа,
;;	b) элементы списка -- любые объекты.

(defun mult-a (num lst)
    (cond
        ((null lst) nil)
        (t (cons (* num (car lst)) (mult-a num (cdr lst))))))

(defun mult-b (num lst)
    (cond
        ((null lst) nil)
        ((numberp (car lst))
            (cons (* num (car lst)) (mult-b num (cdr lst))))
        ((consp (car lst))
            (cons (mult-b num (car lst)) (mult-b num (cdr lst))))
        (t (cons (car lst) (mult-b num (cdr lst))))))
