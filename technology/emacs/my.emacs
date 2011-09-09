;; (read-abbrev-file abbrev-file-name t) ; 变量 abbrev-file-name 默认为 ~/.abbrev_defs

;;; 设置图像
(define-skeleton 1image
  "设置图像"
  ""
  "#+CAPTION:"_"\n#+LABEL: fig:\n#+ATTR_HTML:alt=\"\" title=\"\" align=\"center\"\n#+ATTR_LaTeX: width=0.38\\textwidth wrap placement={r}{0.4\\textwidth},angle=0")

;;; 设置表格
(define-skeleton 1itable
  "设置表格"
  ""
  "#+CAPTION:"_
  "\n#+LABEL: tbl:"
  "\n#+ATTR_HTML: border=\"2\" rules=\"all\" frame=\"all\""
  "\n#+ATTR_LaTeX: table* tabulary width=\\textwidth"
  )

;;; 设置字体
;; 楷体
(define-skeleton 1kai
  "设置在html和latex文件中显示楷体"
  ""
  "#+LaTeX:{\kai"_"}\n"
  "#+HTML:<a></a>")
;; 黑体
(define-skeleton 1hei
  "设置在html和latex文件中显示楷体"
  ""
  "#+LaTeX:{\hei"_"}\n"
  "#+HTML:<strong></strong>")

;;; 设置文件头
(define-skeleton 1title-author
  "添加#+TITLE:和#+AUTHOR"
  ""
  "\n#+TITLE:"_"\n\n#+AUTHOR: ")
;; HTML
(define-skeleton 1header-html
  "添加html选项"
  ""
  "#+MATHJAX: align:\"left\" mathml:t path:\"/MathJax/MathJax.js\"\n"
  "#+OPTIONS: LaTeX:dvipng\n"
  "#+INFOJS_OPT: view:info toc:nil\n")
(define-skeleton 1html-style
  "html css"
  ""
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\""_".css\" />")
;; LaTeX
(define-skeleton 1header-latex
  "LaTeX 文件头"
  ""
  "#+LaTeX_CLASS: article\n"
  "#+LaTeX_CLASS_OPTIONS: [presentation]\n"
)

(define-skeleton 1header-latex-beamer
  "文件头"
  ""
  
  "#+LaTeX_CLASS: beamer\n"
  "#+LaTeX_CLASS_OPTIONS: [presentation]\n"
  "#+BEAMER_FRAME_LEVEL: 2\n"
  "#+BEAMER_HEADER_EXTRA: \\usetheme{Madrid}\\usecolortheme{default}\n"
  "#+COLUMNS: \%35ITEM \%10BEAMER_env(Env) \%10BEAMER_envargs(Args) \%4BEAMER_col(Col) \%8BEAMER_extra(Ex)\n"
)

(define-skeleton 1cntr
  "居中文本"
  ""
  "#+BEGIN_CENTER\n"
  _"\n"
  "#+END_CENTER")

(define-skeleton 1include
  "包含文件"
  ""
  "#+INCLUDE: \""_"\"")

(define-skeleton 1strong
  "强调"
  ""
  "#+LaTeX:\\red{"_"\n#+LaTeX:}\n"
  "#+HTML:<strong style=\"font-size: 13px; color: red;\">"_"\n#+HTML:</strong>")

(define-skeleton 1fn
  "Input [fn:] in org-mode"
  ""
  "[fn:"_"]")

(define-skeleton 1exp 
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
  ""
  "#+BEGIN_EXAMPLE\n"
  _ "\n" 
  "#+END_EXAMPLE"
  )

;; (define-abbrev org-mode-abbrev-table "iexp" "" '1exp)

;;; source code
(define-skeleton 1src 
  "Input #+begin_src #+end_src in org-mode"
  ""
  "#+begin_src lisp \n"
  _ "\n" 
  "#+end_src"
  )

(define-skeleton 1src-latex
  "Input #+begin_src #+end_src in org-mode"
  ""
  "#+begin_src LaTeX \n"
  _ "\n" 
  "#+end_src"
  )


;; (define-abbrev org-mode-abbrev-table "isrc" "" '1src)

(define-skeleton 1prop 
  "Input :PROPERTIES: :END: in org-mode"
  ""
  >":PROPERTIES:\n"
  > _ "\n" 
  >":END:"
  )

(define-skeleton 1quo
  "Generate #+begin_quote...#+end_quote block" nil
  ""
  "#+BEGIN_QUOTE \n"
  _"\n"
  "#+END_QUOTE"
  )
;; (define-abbrev org-mode-abbrev-table "iprop" "" '1prop)

(define-skeleton 1html
  "Generate #+begin_html...#+end_html block" nil
  ""
  "#+BEGIN_HTML\n"
  "<pre lang=\"lisp\" line=\"1\">\n"
  _"\n"
  "</pre>\n"
  "#+END_HTML\n"
  )
(define-skeleton 1htm
  "Generate #+HTML:<a>_</a> block" nil
  ""
  "#+HTML:<a>"_"</a>")

(define-skeleton 1latex
  "Generate #+BEGIN_LaTeX..#+END_LaTeX block" nil
  ""
  "#+BEGIN_LaTeX\n"
  _"\n"
  "#+END_LaTeX\n"
  )

(define-skeleton 1tex
  "Generate #+LaTeX:\red{} block" nil
  ""
  "#+LaTeX:\\red{"_"}")

;; (define-abbrev org-mode-abbrev-table "ihtml"  "" 'insert-emacser-code)

;; 此部分可以写在文件~/.abbrev_defs中
(define-abbrev-table 'org-mode-abbrev-table
  '(
    ;; 表格
    ("itbl" ""
     (lambda nil
       (1itable)) 0)
    ;; 图像
    ("iimg" ""
     (lambda nil
       (1image)) 0)
    ;; 设置字体
    ("ihei" ""
     (lambda nil
       (1hei)) 0)
    ("ikai" ""
     (lambda nil
       (1kai)) 0)
    ;; 设置文件头
    ("istl" ""
     (lambda nil
       (1html-style)) 0)
    ("ihdhtm" ""
     (lambda nil
       (1header-html)) 0)
    ("ita" ""
     (lambda nil
       (1title-author)) 0)
    ("ihdltx" ""
     (lambda nil
       (1header-latex)) 0)
    ("ihdbmr" ""
     (lambda nil
       (1header-latex-beamer)) 0)
    ("istr" ""
     (lambda nil
       (1strong)) 0)
    ("ifn" ""
     (lambda nil
       (1fn)) 0)
    ("iexp" ""
     (lambda nil
       (1exp)) 0)
    ("isrc" ""
     (lambda nil
       (1src)) 0)
    ("istx" ""
     (lambda nil
       (1src-latex)) 0)
    ("iprop" ""
     (lambda nil
       (1prop)) 0)
    ("ihtml" ""
     (lambda nil
       (1html)) 0)
    ("ihtm" ""
     (lambda nil
       (1htm)) 0)
    ("ilatex" ""
     (lambda nil
       (1latex)) 0)
    ("itex" ""
     (lambda nil
       (1tex)) 0)
    ("iquo" ""
     (lambda nil
       (1quo)) 0)
    ("iinc" ""
     (lambda nil
       (1include)) 0)
;;    ("ihtm" "#+html:" nil 0)
;;    ("ilatex" "#+LaTeX:" nil 0)
    ("icap" "#+CAPTION:" nil 0)
    ("iah" "#+ATTR_HTML:" nil 0)
    ("iat" "#+ATTR_LaTeX:" nil 0)
    ("ilbl" "#+LABEL:" nil 0)
    ("ittl" "\n#+TITLE:" nil 0)
    ("idx" "\n#+INDEX:" nil 0)
    ))


(defun i-insert-backspace ()
  "在行尾插入换行符"
  (goto-char "\n")
  ;; (insert "\n")
  ;; (forward-line 1)
  )

(eal-define-keys
 'org-mode-map
 `(("C-."   i-insert-backspace)
   ))

(defun i-babel-quote (beg end str1 str2)
  (goto-char end)
;;  (forward-line 1)
  (insert str2)
  (newline)
  (goto-char beg)
;;  (forward-line -1)
  (newline)
  (insert str1)
  )

;;; 设置字体显示
;; 楷体
(defun ikai (St Ed)
  "Enclose text with specific font-style"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+LaTeX:{\\kai\n#+HTML:<p>" "<\/p>\n#+LaTeX:}")))
;; 黑体
(defun ihei (St Ed)
  "Enclose text with specific font-style"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+LaTeX:{\\hei\n#+HTML:<strong>" "<\/strong>\n#+LaTeX:}")))
;; 注意：在引用段首文字时，选中部分会自动成一段，引用段中文字则正常显示。可用org-mode中的'**'代替。
;;; 设置代码引用
(defun iexp (St Ed)
  "Enclose example for org-mode"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+BEGIN_EXAMPLE" "\n#+END_EXAMPLE")))


(defun isrc (St Ed)
  "Enclose code for org-mode"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+BEGIN_SRC " "\n#+END_SRC")))

(defun iquo (St Ed)
  "Quote code for org-mode"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+BEGIN_QUOTE\n " "\n#+END_QUOTE")))


(defun ihtml (St Ed)
  "Enclose code for Emacser.cn"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end
                   (concat "#+BEGIN_HTML\n " "<pre lang=\"lisp\" line=\"1\">")

                   (concat "</pre>\n" "#+END_HTML")
                   )))

(defun itex (St Ed)
  "Enclose code for export latex file"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end
                   (concat "#+BEGIN_LaTeX\n" "\\red{")

                   "}\n#+END_LaTeX"
                   )))

(defun i= (St Ed)
  ""
  (interactive "r")
  (let ((beg St) (end Ed))
    (goto-char end)
    (insert "=")
    (goto-char beg)
    (insert "=")
    (goto-char (+ end 2)))
  )

;; ;;; CopyWithoutSelection

;; ;; base function

;; (defun get-point (symbol &optional arg)
;;   "get the point"
;;   (funcall symbol arg)
;;   (point)
;;   )

;; (defun copy-thing (begin-of-thing end-of-thing &optional arg)
;;   "copy thing between beg & end into kill ring"
;;   (let ((beg (get-point begin-of-thing 1))
;;         (end (get-point end-of-thing arg)))
;;     (copy-region-as-kill beg end))
;;   )

;; (defun paste-to-mark(&optional arg)
;;   "Paste things to mark, or to the prompt in shell-mode"
;;   (let ((pasteMe 
;;          (lambda()
;;            (if (string= "shell-mode" major-mode)
;;                (progn (comint-next-prompt 25535) (yank))
;;              (progn (goto-char (mark)) (yank) )))))
;;     (if arg
;;         (if (= arg 1)
;;             nil
;;           (funcall pasteMe))
;;       (funcall pasteMe))
;;     ))

;; ;; copy word

;; (defun copy-word (&optional arg)
;;   "Copy words at point into kill-ring"
;;   (interactive "P")
;;   (copy-thing 'backward-word 'forward-word arg)
;;   (paste-to-mark arg)
;;   )

;; (global-set-key (kbd "C-c w")         (quote copy-word))

;; ;; copy line

;; (defun copy-line (&optional arg)
;;       "Save current line into Kill-Ring without mark the line "
;;        (interactive "P")
;;        (copy-thing 'beginning-of-line 'end-of-line arg)
;;        (paste-to-mark arg)
;;      )

;; (global-set-key (kbd "C-c l")         (quote copy-line))

;; ;; copy paragrph

;;  (defun copy-paragraph (&optional arg)
;;       "Copy paragraphes at point"
;;        (interactive "P")
;;        (copy-thing 'backward-paragraph 'forward-paragraph arg)
;;        (paste-to-mark arg)
;;      )

;; (global-set-key (kbd "C-c p")         (quote copy-paragraph))

;; ;; copy string

;;  (defun beginning-of-string(&optional arg)
;;        "  "
;;        (re-search-backward "[ \t]" (line-beginning-position) 3 1)
;;              (if (looking-at "[\t ]")  (goto-char (+ (point) 1)) )
;;      )
;;      (defun end-of-string(&optional arg)
;;        " "
;;        (re-search-forward "[ \t]" (line-end-position) 3 arg)
;;              (if (looking-back "[\t ]") (goto-char (- (point) 1)) )
;;      )
 
;;      (defun thing-copy-string-to-mark(&optional arg)
;;        " Try to copy a string and paste it to the mark
;;      When used in shell-mode, it will paste string on shell prompt by default "
;;        (interactive "P")
;;        (copy-thing 'beginning-of-string 'end-of-string arg)
;;        (paste-to-mark arg)
;;      )

;; (global-set-key (kbd "C-c s")         (quote thing-copy-string-to-mark))

;;; Dynamic blocks
(defun org-dblock-write:block-update-time (params)
   (let ((fmt (or (plist-get params :format) "%d. %m. %Y")))
     (insert "Last block update at: "
             (format-time-string fmt (current-time)))))

(require 'gnuplot)

;;; Custom Agenda Commands

(setq org-agenda-custom-commands 
      '(("c" "Desk Work" tags-todo "computer" ;; (1) (2) (3) (4)
         ((org-agenda-files '("~/www/org/widgets.org" "~/www/org/clients.org")) ;; (5)
          (org-agenda-sorting-strategy '(priority-up effort-down))) ;; (5) cont.
         ("~/www/html/computer.html")) ;; (6)
        ;; ...other commands here
        ("w" todo "STARTED") ;; (1) (3) (4)
        ("O" "Office block agenda"
         ((agenda "" ((org-agenda-ndays 1))) 
          ;; limits the agenda display to a single day
          (tags-todo "+PRIORITY=\"A\"")
          (tags-todo "computer|office|phone")
          (tags "project+CATEGORY=\"elephants\"")
          (tags "review" ((org-agenda-files '("~/org/circuspeanuts.org"))))
          ;; limits the tag search to the file circuspeanuts.org
          (todo "WAITING"))
         ((org-agenda-compact-blocks t))) ;; options set here apply to the entire block
        ;;; GTD weekly review
        ("W" "Weekly Review"
         ((agenda "" ((org-agenda-ndays 7))) ;; review upcoming deadlines and appointments
          ;; type "l" in the agenda to review logged items 
          (stuck "") ;; review stuck projects as designated by org-stuck-projects
          (todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
          (todo "MAYBE") ;; review someday/maybe items
          (todo "WAITING"))) ;; review waiting items

        ("Q" . "Custom queries") ;; gives label to "Q" 
        ("Qa" "Archive search" search ""
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org")))) 
        ("Qw" "Website search" search ""
         ((org-agenda-files (file-expand-wildcards "~/website/*.org"))))
        ("Qb" "Projects and Archive" search ""
         ((org-agenda-text-search-extra-files (file-expand-wildcards "~/archive/*.org"))))
        ;; searches both projects and archive directories
        ("QA" "Archive tags search" org-tags-view "" 
         ((org-agenda-files (file-expand-wildcards "~/archive/*.org"))))

        ("x" "With deadline columns" alltodo ""
         ((org-agenda-overriding-columns-format "%20ITEM %DEADLINE")
          (org-agenda-view-columns-initially t)))

        
        ;;; Speeding up custom agenda commands
        ("d" "Upcoming deadlines" agenda "" 
         ((org-agenda-time-grid nil)
          (org-deadline-warning-days 365)        ;; [1]
          (org-agenda-entry-types '(:deadline))  ;; [2]
          ))
        ;;; GTD contexts

        ("g" . "GTD contexts")
        ("go" "Office" tags-todo "office")
        ("gc" "Computer" tags-todo "computer")
        ("gp" "Phone" tags-todo "phone")
        ("gh" "Home" tags-todo "home")
        ("ge" "Errands" tags-todo "errands")
        ("G" "GTD Block Agenda"
         ((tags-todo "office")
          (tags-todo "computer")
          (tags-todo "phone")
          (tags-todo "home")
          (tags-todo "errands"))
         nil                      ;; i.e., no local settings
         ("~/www/html/next-actions.html")) ;; exports block to this file with C-c a e

        ;;; Priorities
        ("p" . "Priorities")
        ("pa" "A items" tags-todo "+PRIORITY=\"A\"")
        ("pb" "B items" tags-todo "+PRIORITY=\"B\"")
        ("pc" "C items" tags-todo "+PRIORITY=\"C\"")

        ;;; Calendar style views

        ("c" "Weekly schedule" agenda ""
         ((org-agenda-ndays 7)          ;; agenda will start in week view
          (org-agenda-repeating-timestamp-show-all t)   ;; ensures that repeating events appear on all relevant dates
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))  
        ;; limits agenda view to timestamped items

        ("d" "Upcoming deadlines" agenda ""
         ((org-agenda-entry-types '(:deadline))
          ;; a slower way to do the same thing
          ;; (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
          (org-agenda-ndays 1)
          (org-deadline-warning-days 60)
          (org-agenda-time-grid nil)))
        
        ;;; Printed agenda
        ("P" "Printed agenda"
         ((agenda "" ((org-agenda-ndays 7)                      ;; overview of appointments
                      (org-agenda-start-on-weekday nil)         ;; calendar begins today
                      (org-agenda-repeating-timestamp-show-all t)
                      (org-agenda-entry-types '(:timestamp :sexp))))
          (agenda "" ((org-agenda-ndays 1)                      ;; daily agenda
                      (org-deadline-warning-days 7)             ;; 7 day advanced warning for deadlines
                      (org-agenda-todo-keyword-format "[ ]")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-prefix-format "%t%s")))
          (todo "TODO"                                          ;; todos sorted by context
                ((org-agenda-prefix-format "[ ] %T: ")
                 (org-agenda-sorting-strategy '(tag-up priority-down))
                 (org-agenda-todo-keyword-format "")
                 (org-agenda-overriding-header "\nTasks by Context\n------------------\n"))))
         ((org-agenda-with-colors nil)
          (org-agenda-compact-blocks t)
          (org-agenda-remove-tags t)
          (ps-number-of-columns 2)
          (ps-landscape-mode t))
         ("~/agenda.ps"))

        ;; other commands go here
        ))



;;; Export

;; Publishing Org-mode files to HTML

(require 'org-publish)
(setq org-publish-project-alist
      '(
        ;; ... add all the components here (see below)...

        ;; ("org-notes"
        ;;  :base-directory "~/org/"
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/"
        ;;  :recursive t
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3             ; Just the default for this project.
        ;;  :auto-preamble t
        ;;  )
        ;; ("org-static"
        ;;  :base-directory "~/org/"
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/"
        ;;  :recursive t
        ;;  :publishing-function org-publish-attachment
        ;;  )
        ;; ("org" :components ("org-notes" "org-static"))
        
        ;; ("B-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/B/"
        ;;  :publishing-function org-publish-attachment
        ;;  )

        ;; ("B-notes"
        ;;  :base-directory "~/B/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :auto-sitemap t                ; Generate sitemap.org automagically...
        ;;  :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
        ;;  :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.

        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/B/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("B-static"
        ;;  :base-directory "~/B/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/B/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("B" :components ("B-inherit" "B-notes" "B-static"))

        ;; ("C-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/C/"
        ;;  :publishing-function org-publish-attachment
        ;;  )
        ;; ("C-notes"
        ;;  :base-directory "~/C/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/C/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("C-static"
        ;;  :base-directory "~/B/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/B/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("C" :components ("C-inherit" "C-notes" "C-static"))

        

        ;; ("D-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/D/"
        ;;  :publishing-function org-publish-attachment
        ;;  )

        ;; ("D-notes"
        ;;  :base-directory "~/D/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/D/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("D-static"
        ;;  :base-directory "~/D/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/D/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("D" :components ("D-inherit" "D-notes" "D-static"))

        ;; ("E-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/E/"
        ;;  :publishing-function org-publish-attachment
        ;;  )

        ;; ("E-notes"
        ;;  :base-directory "~/E/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/E/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("E-static"
        ;;  :base-directory "~/E/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/E/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("E" :components ("E-inherit" "E-notes" "E-static"))

        ;; ("inherit-org-info-js"
        ;;  :base-directory "~/www/js/"
        ;;  :recursive t
        ;;  :base-extension "js"
        ;;  :publishing-directory "~/public_html/js/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ... all the rest ... ;;

        ;; ("B" :components ("inherit-org-info-js" "B-inherit" "B-notes" "B-static"))
        ;; ("C" :components ("inherit-org-info-js" "C-inherit" "C-notes" "C-static"))
        ;; ("D" :components ("inherit-org-info-js" "D-inherit" "D-notes" "D-static"))
        ;; ("E" :components ("inherit-org-info-js" "E-inherit" "E-notes" "E-static"))

        ("lipt-notes"
         :base-directory "~/lipt/"
         :base-extension "org"
         :publishing-directory "~/www/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 3             ; Just the default for this project.
         :auto-preamble t
         )
        ("lipt-static"
         :base-directory "~/www/"
         :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/www/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("lipt" :components ("lipt-notes" "lipt-static"))
        
        ("jing-inherit"
         :base-directory "~/www/"
         :recursive t
         :base-extension "css\\|js"
         :publishing-directory "~/www/lipt/human-word/people/jingdiwangtian/"
         :publishing-function org-publish-attachment
         )

        ("jing-notes"
         :base-directory "~/lipt/human-word/people/jingdiwangtian/"
         :auto-index t
         :index-filename "sitemap.org"
         :index-title "Sitemap"
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.

         :recursive t
         :base-extension "org"
         :publishing-directory "~/www/human-word/people/jingdiwangtian/"
         :publishing-function org-publish-org-to-html
         :headline-levels 3
         :auto-preamble t
         )
        ("jing-static"
         :base-directory "~/lipt/human-word/people/jingdiwangtian/"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/www/human-word/people/jingdiwangtian/"
         :publishing-function org-publish-attachment)

        ;; ("B" :components ("B-inherit" "B-notes" "B-static"))

        ;; ("C-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/C/"
        ;;  :publishing-function org-publish-attachment
        ;;  )
        ;; ("C-notes"
        ;;  :base-directory "~/C/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/C/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("C-static"
        ;;  :base-directory "~/B/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/B/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("C" :components ("C-inherit" "C-notes" "C-static"))

        

        ;; ("D-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/D/"
        ;;  :publishing-function org-publish-attachment
        ;;  )

        ;; ("D-notes"
        ;;  :base-directory "~/D/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/D/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("D-static"
        ;;  :base-directory "~/D/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/D/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("D" :components ("D-inherit" "D-notes" "D-static"))

        ;; ("E-inherit"
        ;;  :base-directory "~/org/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js"
        ;;  :publishing-directory "~/public_html/E/"
        ;;  :publishing-function org-publish-attachment
        ;;  )

        ;; ("E-notes"
        ;;  :base-directory "~/E/"
        ;;  :auto-index t
        ;;  :index-filename "sitemap.org"
        ;;  :index-title "Sitemap"
        ;;  :recursive t
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/public_html/E/"
        ;;  :publishing-function org-publish-org-to-html
        ;;  :headline-levels 3
        ;;  :auto-preamble t
        ;;  )
        ;; ("E-static"
        ;;  :base-directory "~/E/"
        ;;  :recursive t
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        ;;  :publishing-directory "~/public_html/E/"
        ;;  :publishing-function org-publish-attachment)

        ;; ;; ("E" :components ("E-inherit" "E-notes" "E-static"))

        ("inherit-org-info-js"
         :base-directory "~/lipt/js/"
         :recursive t
         :base-extension "js"
         :publishing-directory "~/www/js/"
         :publishing-function org-publish-attachment)

        ;; ... all the rest ... ;;

        ("jing" :components ("inherit-org-info-js" "jing-inherit" "jing-notes" "jing-static"))
        ;; ("C" :components ("inherit-org-info-js" "C-inherit" "C-notes" "C-static"))
        ;; ("D" :components ("inherit-org-info-js" "D-inherit" "D-notes" "D-static"))
        ;; ("E" :components ("inherit-org-info-js" "E-inherit" "E-notes" "E-static"))

        ))


;;; LaTeX Export

(require 'org-latex)
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; ;; (add-to-list 'org-export-latex-classes
;; ;;              '("article"
;; ;;                "\\documentclass{article}"
;; ;;                ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
             `("book"
               "\\documentclass{book}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
             ;; '("koma-article"
             ;;   "\\documentclass{scrartcl}"
             ;;   ("\\section{%s}" . "\\section*{%s}")
             ;;   ("\\subsection{%s}" . "\\subsection*{%s}")
             ;;   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ;;   ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ;;   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
             ;; '("org-article"
             ;;   "\\documentclass{org-article}
             ;;   [NO-DEFAULT-PACKAGES]
             ;;   [PACKAGES]
             ;;   [EXTRA]"
             ;;   ("\\section{%s}" . "\\section*{%s}")
             ;;   ("\\subsection{%s}" . "\\subsection*{%s}")
             ;;   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ;;   ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ;;   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
             )

;; ;; (unless (find "per-file-class" org-export-latex-classes :key 'car
;; ;;               :test 'equal)
;;   (add-to-list 'org-export-latex-classes
;;                '("per-file-class"
;;                  "\\documentclass{scrartcl}
;;                  [NO-DEFAULT-PACKAGES]
;;                  [EXTRA]"
;;                  ("\\section{%s}" . "\\section*{%s}")
;;                  ("\\subsection{%s}" . "\\subsection*{%s}")
;;                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; (setq org-latex-to-pdf-process
;;       '("texi2dvi --pdf --clean --verbose --batch %f"))
;; ;; Special Characters
;; (setq org-entities-user
;;       '(("space" "\\ " nil " " " " " " " ")))
;; ;; Block-level Markup
;; ;; Inline Markup
;; (org-add-link-type
;;  "latex" nil
;;  (lambda (path desc format)
;;    (cond
;;     ((eq format 'html)
;;      (format "<span class=\"%s\">%s</span>" path desc))
;;     ((eq format 'latex)
;;      (format "\\%s{%s}" path desc)))))

;; ;; (setq org-export-latex-listings 'listings)
;; ;; (setq org-export-latex-custom-lang-environments
;; ;;       '((emacs-lisp "common-lispcode")))
;; ;; (setq org-export-latex-listings-options
;; ;;       '(("frame" "lines")
;; ;;         ("basicstyle" "\\footnotesize")
;; ;;         ("numbers" "left")
;; ;;         ("numberstyle" "\\tiny")))
;; ;; (setq org-latex-to-pdf-process
;; ;;       '("pdflatex -interaction nonstopmode -output-directory %o %f"
;; ;;         "pdflatex -interaction nonstopmode -output-directory %o %f"
;; ;;         "pdflatex -interaction nonstopmode -output-directory %o %f"))


;; (require 'org-taskjuggler)

;; ;;; Tags
;; ;; (setq org-tag-alist '(("URGENT" . ?u)
;; ;;                       ("@PHONE" . ?p)
;; ;;                       ("@ERRANDS" . ?e)))

;; (setq org-agenda-custom-commands
;;       '(("p" tags "PROJECT-MAYBE-DONE" nil)
;;         ("m" tags "PROJECT&MAYBE" nil)
;;         ("a" "My agenda"
;;          ((org-agenda-list)
;;           (tags "PROJECT-MAYBE-DONE")))
;;         ("u" todo "WORK&URGENT" nil)               ;; (1)
;;         ("c" todo "WORK&@PHONE" nil)               ;; (2)
;;         ("h" todo "PERSONAL-@ERRANDS" nil)         ;; (3)
;;         ("p" tags "PROJECT-MAYBE-DONE" nil)        ;; (4)
;;         ("m" tags "PROJECT&MAYBE" nil)
;;         ("a" "My agenda"
;;          ((org-agenda-list)
;;           (tags-todo "URGENT")                     ;; (5)
;;           (tags "PROJECT-MAYBE-DONE")))            ;; (6)
         
;;         ;; ... put your other custom commands here
        
;;         ))


;; (defun wicked/org-calculate-tag-time (matcher &optional ts te)
;;   "Return the total minutes clocked in headlines matching MATCHER.
;; MATCHER is a string or a Lisp form to be evaluated, testing if a
;; given set of tags qualifies a headline for inclusion. TS and TE
;; are time start (inclusive) and time end (exclusive). Call with a
;; prefix to be prompted for TS and TE.

;; For example, to see how much time you spent on tasks tagged as
;; URGENT, call M-x wicked/org-calculate-tag-time RET URGENT RET. To
;; see how much time you spent on tasks tagged as URGENT today, call
;; C-u M-x wicked/org-calculate-tag-time RET URGENT RET . RET +1 RET."
;;   (interactive (list
;;                 (read-string "Tag query: ")
;;                 (if current-prefix-arg (org-read-date))
;;                 (if current-prefix-arg (org-read-date))))
;;   ;; Convert strings to proper arguments
;;   (if (stringp matcher) (setq matcher (cdr (org-make-tags-matcher matcher))))
;;   (if (stringp ts)
;;       (setq ts (time-to-seconds (apply 'encode-time (org-parse-time-string ts)))))
;;   (if (stringp te)
;;       (setq te (time-to-seconds (apply 'encode-time (org-parse-time-string te)))))
;;   (let* ((re (concat "[\n\r]" outline-regexp " *\\(\\<\\("
;;                      (mapconcat 'regexp-quote org-todo-keywords-1 "\\|")
;;                      (org-re
;;                       "\\>\\)\\)? *\\(.*?\\)\\(:[[:alnum:]_@:]+:\\)?[ \t]*$")))
;;          (case-fold-search nil)
;;          lspos
;;          tags tags-list tags-alist (llast 0) rtn level category i txt p
;;          marker entry priority (total 0))
;;     (save-excursion
;;       (org-clock-sum ts te)
;;       (goto-char (point-min))
;;       (while (re-search-forward re nil t)
;;         (catch :skip
;;           (setq tags (if (match-end 4) (match-string 4)))
;;           (goto-char (setq lspos (1+ (match-beginning 0))))
;;           (setq level (org-reduced-level (funcall outline-level))
;;                 category (org-get-category))
;;           (setq i llast llast level)
;;           ;; remove tag lists from same and sublevels
;;           (while (>= i level)
;;             (when (setq entry (assoc i tags-alist))
;;               (setq tags-alist (delete entry tags-alist)))
;;             (setq i (1- i)))
;;           ;; add the nex tags
;;           (when tags
;;             (setq tags (mapcar 'downcase (org-split-string tags ":"))
;;                   tags-alist
;;                   (cons (cons level tags) tags-alist)))
;;           ;; compile tags for current headline
;;           (setq tags-list
;;                 (if org-use-tag-inheritance
;;                     (apply 'append (mapcar 'cdr tags-alist))
;;                   tags))
;;           (when (and (eval matcher)
;;                      (or (not org-agenda-skip-archived-trees)
;;                          (not (member org-archive-tag tags-list))))
;;             ;; Get the time for the headline at point
;;             (goto-char (line-beginning-position))
;;             (setq total (+ total (or (get-text-property (1+ (point)) :org-clock-minutes) 0)))
;;             ;; if we are to skip sublevels, jump to end of subtree
;;             (org-end-of-subtree t)))))
;;     (if (interactive-p)
;;         (let* ((h (/ total 60))
;;                (m (- total (* 60 h))))
;;           (message "Time: %d:%02d (%d hours and %d minutes)" h m h m)))
;;     total))




