(load "./task1.lisp")
(load "./task2.lisp")
(load "./task3.lisp")
(load "./task4.lisp")
(load "./task5.lisp")
(load "./task6.lisp")
(load "./task7.lisp")
(load "./task8.lisp")
(load "./task9.lisp")
(load "./task10.lisp")

(load "~/quicklisp/setup.lisp")
(ql:quickload "fiveam")
(use-package 'fiveam)

(def-suite main-suite)

(def-suite* task1-suite :in main-suite)

(test test-1-1 (is (equal (my-reverse '()) '())))
(test test-1-2 (is (equal (my-reverse '(a)) '(a))))
(test test-1-3 (is (equal (my-reverse '(1 2 3)) '(3 2 1))))

(def-suite* task2-suite :in main-suite)

(test test-2-1 (is (equal (get-first-list '()) nil)))
(test test-2-2 (is (equal (get-first-list '(a b c)) nil)))
(test test-2-3 (is (equal (get-first-list '(a () c)) nil)))
(test test-2-4 (is (equal (get-first-list '(() b (c))) '(c))))

(def-suite* task3-suite :in main-suite)

(test test-3-1 (is (equal (select-between-3 '(6 1 2 5 4 3) 2 5) '(4 3))))

(def-suite* task4-suite :in main-suite)

(test test-4-1 (is (equal (mult-a 3 '()) '())))
(test test-4-2 (is (equal (mult-a 3 '(1 2 3)) '(3 6 9))))
(test test-4-3 (is (equal (mult-a 0 '(1 2 3)) '(0 0 0))))

(test test-4-4 (is (equal (mult-b 3 '()) '())))
(test test-4-5 (is (equal (mult-b 2 '(a b c)) '(a b c))))
(test test-4-6 (is (equal (mult-b 0 '(10 a 2)) '(0 a 0))))
(test test-4-7 (is (equal (mult-b -1 '(3 a 2)) '(-3 a -2))))
(test test-4-7 (is (equal (mult-b -1 '(3 a (1 2 b) 2)) '(-3 a (-1 -2 b) -2))))

(def-suite* task5-suite :in main-suite)

(test test-5-1 (is (equal (select-between '() 0 1) '())))
(test test-5-2 (is (equal (select-between '(10 12 -3) 0 1) '())))
(test test-5-3 (is (equal (select-between '(0 1 0.4 0.2) 0 1) '(0.2 0.4))))

(def-suite* task6-suite :in main-suite)

(test test-6-1 (is (eql (rec-add-a '()) 0)))
(test test-6-2 (is (eql (rec-add-a '(a b c)) 0)))
(test test-6-3 (is (eql (rec-add-a '(3)) 3)))
(test test-6-4 (is (eql (rec-add-a '(a 1 b 2 c 3)) 6)))

(test test-6-5 (is (eql (rec-add-b '()) 0)))
(test test-6-6 (is (eql (rec-add-b '(a b c)) 0)))
(test test-6-7 (is (eql (rec-add-b '(3)) 3)))
(test test-6-8 (is (eql (rec-add-b '(a 1 b 2 c 3)) 6)))

(test test-6-9 (is (eql (rec-add-b '(() () (()))) 0)))
(test test-6-10 (is (eql (rec-add-b '(a (b) c)) 0)))
(test test-6-11 (is (eql (rec-add-b '(3 ((a) (2)))) 5)))
(test test-6-12 (is (eql (rec-add-b '(a (1 (b 2) c) 3)) 6)))

(def-suite* task7-suite :in main-suite)

(test test-7-1 (is (eql (recnth 0 '(1 2 3)) 1)))
(test test-7-2 (is (eql (recnth 1 '(1 2 3)) 2)))
(test test-7-3 (is (eql (recnth 2 '(1 2 3)) 3)))
(test test-7-4 (is (eql (recnth 3 '(1 2 3)) nil)))

(def-suite* task8-suite :in main-suite)

(test test-8-1 (is (eq (allodd '()) t)))
(test test-8-2 (is (eq (allodd '(1 3 5)) t)))
(test test-8-3 (is (eq (allodd '(1 2 5)) nil)))
(test test-8-4 (is (eq (allodd '(6 6 6)) nil)))

(def-suite* task9-suite :in main-suite)

(test test-9-1 (is (eql (get-first-odd '()) nil)))
(test test-9-2 (is (eql (get-first-odd '(2 4 6)) nil)))
(test test-9-3 (is (eql (get-first-odd '(2 5 6)) 5)))
(test test-9-4 (is (eql (get-first-odd '((2 4) (3 1) 5)) 3)))

(def-suite* task10-suite :in main-suite)

(test test-10-1 (is (equal (squares '()) '())))
(test test-10-2 (is (equal (squares '(1)) '(1))))
(test test-10-3 (is (equal (squares '(-2 2)) '(4 4))))
(test test-10-4 (is (equal (squares '(5 3 1)) '(25 9 1))))

(explain! (run 'main-suite))
