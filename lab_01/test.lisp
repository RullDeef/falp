; (defun triangle-area (side height) (* 0.5 side height))

(format t "input side:~%")

(let ((side (read)))
    (list
        (format t "input height:~%")
        (let ((height (read))
            (format t "triangle area is: ~A~%"
                (* 0.5 side height)
            )
        )
    )
)
