;; Написать функцию решения квадратного уравнения (все случаи)

(defun find-roots (a b c)
    (if (= a 0)
        (if (= b 0)
            (if (= c 0)
                "любое"
                "нет решений"
            )
            (/ (- 0 c) b)
        )
        (let ((d (- (* b b) (* 4 a c))))
            (if (= d 0)
                (/ b (* -2 a))
                (list
                    (/ (+ b (sqrt d)) (* -2 a))
                    (/ (- b (sqrt d)) (* -2 a))
                )
            )
        )
    )
)

(defun find-roots-to-file (a b c)
    (let ((roots (find-roots a b c)))
        (progn
            (with-open-file (file "./output.txt"
                    :direction :output
                    :if-exists :supersede
                    :if-does-not-exist :create)
                (format file "Корни уравнения ~Ax^2 + ~Ax + ~A = 0:~%~A~%" a b c
                (if (listp roots)
                    (if (complexp (car roots))
                        (list
                            (format nil "(~A + ~Ai)"
                                (realpart (car roots))
                                (imagpart (car roots))
                            )
                            (format nil "(~A + ~Ai)"
                                (realpart (cadr roots))
                                (imagpart (cadr roots))
                            )
                        )
                        roots
                    )
                    roots
                )))
            roots
        )
    )
)
