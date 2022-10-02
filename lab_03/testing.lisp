(load "./defence.lisp")

(load "~/quicklisp/setup.lisp")
(ql:quickload "fiveam")
(use-package 'fiveam)


(def-suite* roots-suite)

(test test-1 (is (equal "любое" (find-roots-to-file 0 0 0))))
(test test-2 (is (equal "нет решений" (find-roots-to-file 0 0 4))))
(test test-3 (is (equal 0 (find-roots-to-file 0 4 0))))
(test test-4 (is (equal 3/2 (find-roots-to-file 0 -2 3))))
(test test-5 (is (equal 0 (find-roots-to-file 1 0 0))))
(test test-6 (is (equal '(-1.0 -0.0) (find-roots-to-file 1 1 0))))
(test test-7 (is (equal '(#C(-0.0 -1.0) #C(-0.0 1.0)) (find-roots-to-file 1 0 1))))

(run!)
