;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; What is a File
;; A file is either 
;; 1. empty ,or
;; 2. (cons symbol file)
(define NEWLINE 'NL)
(list 'how 'are 'you 'NL
      'doing '? 'NL
      'any 'process '?)
;; = 
(list (list 'how 'are 'you)
      (list 'doing '? )
      (list 'any 'process '?))

(list 'a 'b 'c 'NL
      'd 'e 'NL
      'f 'g 'h 'NL)
;; = 
(list (list 'a 'b 'c)
      (list 'd 'e)
      (list 'f 'g 'h))


;;  Ex27.2.1 Determine what the list-of-lines representation for empty, (list 'NL), and (list 'NL 'NL) should be. Why are these examples important test cases?
;;  (list (list empty)) 

;; file->list-of-lines : file -> (listof (listof symbol))
;;to convert a file into a list of lines
(define (file->list-of-lines afile)
  (cond
    [(empty? afile) empty]
    [else
     (cons (first-line afile)
           (file->list-of-lines (remove-first-line afile)))]))

;;first-line : file -> (listof symbol)
;; to compute the prefix of afile up to the first occurrence of NEWLINE
(define (first-line afile)
  (cond
    [(empty? afile) empty]
    [else (cond
            [(symbol=? NEWLINE (first afile)) empty]
            [else (cons (first afile) (first-line (rest afile)))])]))

;;remove-first-line : file -> file
;; to produce rest of a file except of FIRST LINE FILE
;;example (remove-first-line (list 'a 'b 'c 'NL
;;      'd 'e 'NL
;;      'f 'g 'h 'NL)) -> (list 'd 'e 'NL
;;                              'f 'g 'h 'NL)
(define (remove-first-line afile)
  (cond
    [(empty? afile) empty]
    [else (cond
            [(symbol=? NEWLINE (first afile)) (contain-rest-line (rest afile))]
            [else (remove-first-line (rest afile))])]))
;;---------------------------------------------------------------------------------
;;below is better
(define (remove-first-line-1 afile)
  (cond
    [(empty? afile) empty]
    [else (cond
            [(symbol=? NEWLINE (first afile)) (rest afile)]
            [else (remove-first-line (rest afile))])]))

;;contain-rest-line : (list 'a 'b 'NL) -> (list 'a 'b 'NL)
;;to produce a list same as list that given
(define (contain-rest-line afile)
  afile)

;;---------------------------------------------------------------------------------
;;the track of compute
(file->list-of-lines (list 'a 'b 'c 'NL
      'd 'e 'NL
      'f 'g 'h 'NL))
(cons (first-line (list 'a 'b 'c 'NL
      'd 'e 'NL
      'f 'g 'h 'NL)) (file->list-of-lines (remove-first-line-1 (list 'a 'b 'c 'NL
      'd 'e 'NL
      'f 'g 'h 'NL))))
(cons (list 'a 'b 'c) (file->list-of-lines (list 'd 'e 'NL)
                                           (list 'f 'g 'h 'NL)))
(cons (list 'a 'b 'c) (list 'd 'e) (file->list-of-lines (remove-first-line ((list 'd 'e 'NL)
                                           (list 'f 'g 'h 'NL)))))
(cons (list 'a 'b 'c) (list 'd 'e) (file->list-of-lines (list 'f 'g 'h 'NL)))
(cons (list 'a 'b 'c) (list 'd 'e) (list 'f 'g 'h))
xs

  
