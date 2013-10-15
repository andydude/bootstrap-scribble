#lang racket
(require 
  (except-in scribble/base verbatim)
  scribble/core
  scribble/html-properties
  scriblib/render-cond)
(provide
  code
  code-input
  code-output
  verbatim)

;(define inbox-style
;    (make-style "InBox"
;                (list (make-css-addition "inbox.css")
;
;(require scribble/core)
;(require scriblib/render-cond)

(define bdoc "Bootstrap-Scribble")

(define html-article-style
  (make-style "bscrbl-article"
              (list (make-alt-tag "article"))))

(define html-aside-style
  (make-style "bscrbl-aside"
              (list (make-alt-tag "aside"))))

(define html-header-style
  (make-style "bscrbl-header"
              (list (make-alt-tag "header"))))

(define html-footer-style
  (make-style "bscrbl-footer"
              (list (make-alt-tag "footer"))))

(define html-main-style
  (make-style "bscrbl-main"
              (list (make-alt-tag "main"))))

(define html-blockquote-style
  (make-style "bscrbl-blockquote"
              (list (make-alt-tag "blockquote"))))

(define html-dl-style
  (make-style "bscrbl-dl"
              (list (make-alt-tag "dl"))))

(define html-dt-style
  (make-style "bscrbl-dt"
              (list (make-alt-tag "dt"))))

(define html-dd-style
  (make-style "bscrbl-dd"
              (list (make-alt-tag "dd"))))

(define html-pre-style
  (make-style "bscrbl-pre"
              (list (make-alt-tag "pre"))))

(define html-q-style
  (make-style "bscrbl-q"
              (list (make-alt-tag "q"))))

(define html-code-style
  (make-style "bscrbl-code"
              (list (make-alt-tag "code"))))

(define html-samp-style
  (make-style "bscrbl-samp"
              (list (make-alt-tag "samp"))))

(define html-kbd-style
  (make-style "bscrbl-kbd"
              (list (make-alt-tag "kbd"))))

(define html-span-style
  (make-style "bscrbl-span"
              (list (make-alt-tag "span"))))

(define (code . rest)
  (cond-element
   (html (make-element html-code-style rest))))

(define (code-input . rest)
  (cond-element
   (html (make-element html-kbd-style rest))))

(define (code-output . rest)
  (cond-element
   (html (make-element html-samp-style rest))))

(define (verbatim . rest)
  (cond-element
   (html (make-element html-pre-style rest))))
