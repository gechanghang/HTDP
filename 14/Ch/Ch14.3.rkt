;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ch14.3) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; Size : wp -> number
;; to determine the number of symbols that occur in the web page
(define (size wp)
  (cond
    [(empty? wp) 0]
    [(symbol? (first wp)) (+ 1 (size (rest wp))) ]
    [else (+ (size (first wp)) (size (rest wp)))]))