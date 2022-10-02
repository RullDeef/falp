(defun how-alike (x y)
    (or
        (and (or (= x y) (equal x y)) 'the_same)
        (and (oddp x) (oddp y) 'both_odd)
        (and (evenp x) (evenp y) 'both_even)
        'difference
    )
)

(defun how-alike (x y)
    (if (= x y)
        'the_same
        (if (equal x y)
            'the_same
            (if (oddp x)
                (if (oddp y)
                    'both_odd
                    (if (evenp x)
                        (if (evenp y)
                            'both_even
                            'difference
                        )
                        'difference
                    )
                )
                (if (evenp x)
                    (if (evenp y)
                        'both_even
                        'difference
                    )
                    'difference
                )
            )
        )
    )
)
