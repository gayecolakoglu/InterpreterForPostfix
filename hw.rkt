#lang racket/base

(printf "Please put space between every character\n")
(define a (read (open-input-string (format "(~a)" (read-line)))))



(define (make-stack)
  (let ((stack '()))
    (lambda (msg . args)
      (cond 
        [(eq? msg 'pop!)  (set! stack (cdr stack))]
        [(eq? msg 'push!) (set! stack (append (reverse args) stack))]
        [(eq? msg 'stack) stack]
        [else "Not valid message!"]))))

(define s (make-stack))
(define x 0)




(for ([i a])
   
   (if (number? i) (s 'push! i)
    
     (cond
         [(eq? i '+) 
                     (set! x (+ (list-ref (s 'stack) 0) (list-ref (s 'stack) 1)))
                     (s 'pop!)
                     (s 'pop!)
                     (s 'push! x)
                     
                      ]
         [(eq? i '-) 
                     (set! x (- (list-ref (s 'stack) 1) (list-ref (s 'stack) 0)))
                     (s 'pop!)
                     (s 'pop!)
                     (s 'push! x)
                     
                      ]
         [(eq? i '*) 
                     (set! x (* (list-ref (s 'stack) 1) (list-ref (s 'stack) 0)))
                     (s 'pop!)
                     (s 'pop!)
                     (s 'push! x)
                     
                      ]
         [(eq? i '/) 
                     (set! x (/ (list-ref (s 'stack) 1) (list-ref (s 'stack) 0)))
                     (s 'pop!)
                     (s 'pop!)
                     (s 'push! x)
                     
                      ]
         )
      
      )

    )
(list-ref (s 'stack) 0)