#lang racket
(require 
  (except-in scribble/base verbatim)
  scribble/core
  scriblib/render-cond)
(provide
  doc
  verbatim)

(define doc "Bootstrap-Scribble")

(define (verbatim . rest)
  (cond-element
   (html (apply append `("<pre>" ,@rest "</pre>")))))

