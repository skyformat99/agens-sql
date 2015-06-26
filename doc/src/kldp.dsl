<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY % html "IGNORE">
<![%html;[
<!ENTITY % print "IGNORE">
<!ENTITY docbook.dsl SYSTEM "/usr/share/sgml/docbook/dsssl-stylesheets-1.79/html/docbook.dsl" CDATA dsssl>
]]>
<!ENTITY % print "INCLUDE">
<![%print;[
<!ENTITY docbook.dsl SYSTEM "/usr/share/sgml/docbook/dsssl-stylesheets-1.79/print/docbook.dsl" CDATA dsssl>
]]>
]>

<style-sheet>
<style-specification id="print" use="docbook">
<style-specification-body> 

;;
;; DocBook Stylesheet for KLDP ( http://kldp.org )
;; This is based on Modular DocBook Stylesheet ( http://nwalsh.com )
;; 
;; Update : 2001/05/04
;;
;; Maintained by Park Yong Joo ( yongjoo@kldp.org )
;;
;; 한글 DocBook 문서를 위한 KLDP 스타일시트입니다.
;; Norman Walsh의 Modular DocBook Stylesheet와 함께 사용하여야 합니다.
;;
;; Contributors
;;  Chung, Ha-Nyung ( alita@kldp.org )
;;  Im Eun Jae ( eunjae@kldp.org )
;;  J.-Y. Hoh ( jhoh@stud.uni-goettingen.de )
;;  juami@mail.pentasecurity.com 
;;  Kang, Joonsun( bigbear@ece.skku.ac.kr )
;;  Kim Hyun Soo ( polsci@hitel.net )
;;  KIM KyungHeon ( tody@teoal.net )
;;  Kim Yun Han ( spbear@hanmail.net )
;;  Lee Suk Chan ( acetcom@pentasecurity.com )
;;  rainlood ( rainlood@kldp.org )
;;  Yang Yoo Seong ( yooseong@kldp.org )
;; 
;; Specially thanks to Kwon Soon Sun ( kss@kldp.org )
;;
;; Any suggestion or questions? subscribe Docs@list.kldp.org
;; also http://docs.kldp.org for more information
;;
;; DocBook과 스타일시트의 사용법에 대해서는
;; 열린 글짓기 홈페이지(http://docs.kldp.org)를 참고하세요.
;; 메일링 리스트(Docs@list.kldp.org)에서는 오픈 소스 문서화에 대한
;; 질문과 토론을 기다리고 있습니다.
;; 

 ;; =====================================
 ;;
 ;; 여기서부터 print용 스타일시트 부분입니다.
 ;; 
 ;; =====================================

 ;; =====================================
 ;;
 ;; Modular DocBook Sytlesheet에서 제공하는
 ;; 여러 파라미터들의 값을 설정합니다. 이 부분은 
 ;; LDP 스타일시트를 많이 참고하였습니다(http://www.linuxdoc.org). 
 ;; 이 밖에도 무척 많은 파라미터들이 있습니다. 자세한 내용은
 ;; 스타일시트 문서를 참고하시기 바랍니다.
 ;; http://nwalsh.com/docbook/dsssl/doc/
 ;;
 ;; 이 부분의 소스는 print/dbparam.dsl 입니다. 
 ;;

(define (toc-depth nd)
  ;; '차례'의 깊이를 조절합니다. 정수값을 늘리면
  ;; 차례가 좀더 자세하게(깊게) 나옵니다. 지나치게 깊어지면 
  ;; 불필요한 군더더기가 나오므로 이때는 값을 줄여줍니다. 
  2)

(define %paper-type%
  ;; 종이의 규격을 설정합니다. "USletter"와 A B C 시리즈가 가능합니다. 
  "A4")

(define %two-side% 
  ;; 양면 인쇄용으로 변환할 것인지를 결정합니다.
  ;; #t로 값을 주면 페이지 번호가 좌우에 번갈아 나타납니다.
  #f)

(define bop-footnotes
  ;; 주석을 각 페이지 아래에 바로 넣어줍니다. #f로 값을 주면
  ;; 각 절(section)의 마지막에 주석이 자리하게 됩니다. 
  ;; 이 기능은 TeX 형태로 문서를 변환할 때
  ;; jade에 -V tex-backend 옵션을 주어야 작동합니다.
  #t)

(define %generate-article-titlepage-on-separate-page%
  ;; article의 title page가 따로 한 페이지 차지하도록 
  ;; 할 것인지 결정합니다.
  #f)

(define %graphic-default-extension% 
  ;; graphic 기초요소의 fileref 속성에서,
  ;; %graphic-extensions%에서 지정한 확장명이 붙지 않은 그림 
  ;; 파일 이름이 있으면 자동으로 이곳에 제시된 확장명을 사용합니다. 
  ;; 이 기능은 그림이 든 문서를 여러가지 형태로 변환할 때 유용합니다.
  ;; #f로 값을 주면 이 기능은 작동하지 않게 됩니다.
  #f)

(define %graphic-extensions% 
  ;; graphic 기초요소의 fileref 속성에 사용될
  ;; 그림 파일의 확장명을 나열합니다.
  '("eps" "epsf" "gif" "tif" "tiff" "jpg" "jpeg" "png"))

(define %para-indent-firstpara%
  ;; 첫번째 문단의 들여쓰기 간격을 조절합니다.
  5pt)

(define %para-indent%
  ;; 첫번째 문단이 아닌 다른 문단의 들여쓰기 간격을 
  ;; 조절합니다.
  5pt)

(define formal-object-float
  ;; formal object들의 떠다님 기능을 설정합니다.
  ;; 이 기능을 사용하게 되면 표와 그림들이 적당한 위치를
  ;; 찾아 `떠다니게' 됩니다. informal로 정의된 경우
  ;; (informalfigure 등)의 경우에는 적용되지 않습니다.
  ;; #f로 값을 주면 원래 삽입된 위치에서 고정됩니다.
  #f)

(define %section-autolabel%
  ;; 각 절(section)의 제목에 1.1.1. 형식의
  ;; 번호를 달아줍니다.
  #t)

(define %admon-graphics%
  ;; caution이나 warning 등을 그림 아이콘을 사용해 표현할 것인지
  ;; 결정합니다. 
  #f)

(define %admon-graphics-path%
  ;; %admon-graphics%에서 사용할 그림 파일의 경로를 지정합니다.
  "../images/")

 ;; ======================================
 ;;
 ;; 스타일시트의 파라미터는 아니지만 몇가지 문제점을
 ;; 피해가기 위해 수정하는 부분입니다.

(declare-characteristic preserve-sdata?
  ;; character entity가 그대로 출력되어 버리는 문제를 해결해 줍니다.
  ;; 이 문제점은 김현수(polsci@hitel.net)님이 지적해 주셨습니다.
  "UNREGISTERED::James Clark//Characteristic::preserve-sdata?"
  #f)

 ;; =======================================
 ;;
 ;; 여기서부터는 좀더 자연스러운 한글 표현을 위해
 ;; Modular DocBook Stylesheet의 print 부분을 수정합니다.
 ;;

(element emphasis 
  ;; emphasis를 무조건 굵은 글씨체로 표현하도록 합니다. 
  ;; 기본값은 이탤릭체입니다.
  ;; 이 부분은 Chung, Ha-Nyung(alita@kldp.org)님이
  ;; 지적해 주셨습니다.
  ;; 소스는 print/dbinline.dsl 입니다.
  ($bold-seq$))

(define (book-titlepage-recto-elements)
  ;; 최상위 기초요소 book의 표지에서 어떤 내용이
  ;; 나오도록 할지 지정합니다. 엮은이와 옮긴이를 위한
  ;; 'editor'와 'othercredit'가 추가되었습니다.
  ;; 소스는 print/dbttlpg.dsl 입니다.
  (list (normalize "title") 
	(normalize "subtitle") 
	(normalize "graphic") 
	(normalize "mediaobject")
	(normalize "corpauthor") 
	(normalize "authorgroup") 
	(normalize "author") 
	(normalize "editor")
	(normalize "othercredit")
))

(define (book-titlepage-verso-elements)
  ;; 최상위 기초요소 book의 속지에서 어떤 내용이
  ;; 나오도록 할지 지정합니다. 엮은이와 옮긴이를 위한
  ;; 'editor'와 'othercredit'가 추가되었습니다.
  ;; 소스는 print/dbttlpg.dsl 입니다.
  (list (normalize "title") 
	(normalize "subtitle") 
	(normalize "corpauthor") 
	(normalize "authorgroup") 
	(normalize "author") 
	(normalize "editor")
	(normalize "othercredit")
	(normalize "edition") 
	(normalize "pubdate") 
	(normalize "copyright")
	(normalize "abstract") 
	(normalize "legalnotice") 
	(normalize "revhistory")
))

(define (article-titlepage-recto-elements)
  ;; 최상위 기초요소 article의 표지에서 어떤 내용이
  ;; 나오도록 할지 지정합니다. 엮은이와 옮긴이를 위한
  ;; 'editor'와 'othercredit'가 추가되었습니다.
  ;; 소스는 print/dbttlpg.dsl 입니다.
  (list (normalize "title") 
	(normalize "subtitle") 
	(normalize "corpauthor") 
	(normalize "authorgroup") 
	(normalize "author") 
	(normalize "editor")
	(normalize "othercredit")
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "abstract")
	(normalize "legalnotice")
	(normalize "revhistory")
	(normalize "releaseinfo")
))

(mode article-titlepage-recto-mode
  (element editor
    ;; article의 표지에서 editor 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    ;; 소스는 print/dbttlpg.dsl 입니다.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
              use: article-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 1)
	      quadding: %article-title-quadding%
	      keep-with-next?: #t
	      ;; lang 속성에 상관없이 'edited by'를 '엮은이'로
	      ;; 나오도록 합니다.
	      (literal "\U-C5EE;\U-C740;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
          use: article-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; 아래는 원래 소스에 있는 내용이지만 보기 싫은
	  ;; 빈 공간을 없애기 위해 주석 처리하였습니다.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %article-title-quadding%
	  keep-with-next?: #t
	  (literal editor-name))
	(process-node-list editor-affil))))

  (element contrib
    ;; contrib이 어떻게 보여지도록 할지 묘사합니다.
    (make paragraph
      use: article-titlepage-recto-style
      quadding: %article-title-quadding%
      (process-children)))

  (element othercredit
    ;; article의 표지에서 othercerdit 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    (let ((credit-name (author-string))
	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib")))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
              use: article-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 1)
	      quadding: %article-title-quadding%
	      keep-with-next?: #t
	      ;; lang 속성에 상관없이 othercredit을
              ;; `도운이'로 나오도록 합니다.
	      (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
          use: article-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; 이 부분은 원래 소스에 있는 내용이지만
	  ;; 보기싫은 빈 여백을 없애기 위해 주석처리하였습니다.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %article-title-quadding%
	  keep-with-next?: #t
	  (literal credit-name))
	;; othercredit의 contrib을 나오도록 합니다.
	(process-node-list credit-contrib)
	(process-node-list credit-affil))))

  (element copyright
    ;; Copyright은 한국어 지역화에서 '저작권'으로 번역되어 
    ;; 있지만 좀더 자연스러운 문서를 위해 영문 표현을
    ;; 그대로 가져다 씁니다.
    (make paragraph
      use: article-titlepage-recto-style
      quadding: %article-title-quadding%
      (literal "Copyright")
      (literal "\no-break-space;")
      ;; copyright 문자가 한글 환경에서 깨지는 것을 방지하기 위해
      ;; 원문자 c를 대신 사용합니다.
      ;; 이 문제점은 juami@mail.pentasecurity.com 님이
      ;; 지적해 주셨습니다.
      (literal "\U-24D2;")
      (literal "\no-break-space;")
      (process-children)))

  (element (copyright year)
    ;; Copyright의 저작권 갱신 년도를 영문으로
    ;; 표현합니다.
    (make sequence
      (process-children)
      (if (not (last-sibling? (current-node)))
	  (literal ", ")
	  (literal (string-append " " "by" " ")))))
  
)

(mode book-titlepage-recto-mode
  (element editor
    ;; book의 표지에서 editor 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    ;; 소스는 print/dbttlpg.dsl 입니다.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
	      use: book-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 3)
	      quadding: %division-title-quadding%
	      keep-with-next?: #t
	      ;; lang 속성에 상관없이 'edited by'가
	      ;; `엮은이'로 나오도록 합니다.
	      (literal "\U-C5EE;\U-C740;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
	  use: book-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; 아래는 원래 소스에 포함되어 있는 내용이지만
	  ;; 보기 싫은 여백을 없애기 위해 주석처리하였습니다.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %division-title-quadding%
	  keep-with-next?: #t
	  (literal editor-name))
	(process-node-list editor-affil))))

  (element othercredit
    ;; book의 표지에서 othercredit 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    (let ((credit-name (author-string))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence      
	(if (first-sibling?) 
	    (make paragraph
	      use: book-titlepage-recto-style
	      font-size: (HSIZE 1)
	      line-spacing: (* (HSIZE 1) %line-spacing-factor%)
	      space-before: (* (HSIZE 2) %head-before-factor% 3)
	      quadding: %division-title-quadding%
	      keep-with-next?: #t
	      ;; lang 속성에 상관없이 othercredit가
	      ;; '도운이'로 나오도록 합니다.
	      (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	    (empty-sosofo))
	(make paragraph
	  use: book-titlepage-recto-style
	  font-size: (HSIZE 3)
	  line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	  ;; 아래는 원래 소스에 있던 내용이지만 보기싫은
	  ;; 여백을 없애기 위해 주석처리하였습니다.
	  ;; space-after: (* (HSIZE 2) %head-after-factor% 2)
	  quadding: %division-title-quadding%
	  keep-with-next?: #t
	  (literal credit-name))
	(process-node-list credit-affil))))

)

(mode book-titlepage-verso-mode
  (element author
    ;; book의 속지에서 author 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    ;; 소스는 print/dbttlpg.dsl 입니다.
    (let ((in-group (have-ancestor? (normalize "authorgroup") (current-node))))
      (if (not in-group)
	  (make paragraph
	    space-after: (* %bf-size% %line-spacing-factor%)
	    (make sequence
	      ;; lang 속성에 상관없이 'by'가 '지은이'로
	      ;; 나오도록 합니다.
	      (literal "\U-C9C0;\U-C740;\U-C774;")
	      (literal "\no-break-space;")
	      (literal (author-list-string))))
	  (make sequence 
	    (literal (author-list-string))))))  

  (element editor
    ;; book의 속지에서 editor 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    ;; 소스는 print/dbttlpg.dsl 입니다.
    (let ((in-group (have-ancestor? (normalize "authorgroup") (current-node))))
      (if (or #t (not in-group))
	  (make paragraph
	    space-after: (* %bf-size% %line-spacing-factor%)
	    (make sequence
	      ;; lang 속성에 상관없이 'edited by'가 '엮은이'로
	      ;; 나오도록 합니다.
	      (literal "\U-C5EE;\U-C740;\U-C774;")
	      (literal "\no-break-space;")
	      (literal (author-string))))
	  (make sequence 
	    (literal (author-string))))))

  (element contrib
    ;; contrib이 어떻게 나오도록 할지 묘사합니다.
    (make paragraph
      use: book-titlepage-verso-style
      (process-children)))

  (element othercredit
    ;; book의 속지에서 othercrdit 기초요소가 어떻게 보여지도록 
    ;; 할지 묘사합니다.
    (let ((in-group (have-ancestor? (normalize "authorgroup") (current-node)))
      	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib"))))
      (if (or #t (not in-group))
	  (make paragraph
	    space-after: (* %bf-size% %line-spacing-factor%)
	    (make sequence
	      ;; lang 속성에 상관없이 othercredit가 
	      ;; '도운이'로 나오도록 합니다.
	      (literal "\U-B3C4;\U-C6B4;\U-C774;")
	      (literal "\no-break-space;")
	      (literal (author-string))
	      (process-node-list credit-contrib)))
	  (make sequence 
	    (literal (author-string))
	    (process-node-list credit-contrib)))))

  (element copyright
    (make paragraph
      use: book-titlepage-verso-style
    ;; 한국어 지역화에 관계없이 영문 표현으로
    ;; 저작권을 나타냅니다.
      (literal "Copyright")
      (literal "\no-break-space;")
      (literal "\U-24D2;")
      (literal "\no-break-space;")
      (process-children)))

  (element (copyright year)
    ;; 저작권 갱신 년도를 영문으로 표현합니다.
    (make sequence
      (process-children)
      (if (not (last-sibling? (current-node)))
	  (literal ", ")
	  (literal (string-append " " "by" " ")))))

)

(define (auto-xref-indirect target 
			    #!optional
			    (xref-string (gentext-xref-strings target)))
  ;; 참조를 '1장의 "제목" 절' 형식으로 표현하기 위한 부분입니다.
  ;; 원형은 'the section called "title" in chaper 1' 형식입니다.
  ;; common/dbl1ko.dsl에서 'the section called "title"'은
  ;; '"제목" 절'로, 'in'은 '의'로 대응되어 있습니다.
  ;;
  ;; 여기서는 'the section called "title"' 부분과
  ;; 'in chapter 1' 부분을 뒤바꾸어 
  ;; '의 1장 "제목" 절' 형태로 만들어 줍니다.
  ;; 소스는 common/dbcommon.dsl 입니다.

  (make sequence
    (auto-xref-direct target xref-string)
    (auto-xref-indirect-connector target)))

(define (auto-xref target 
		   #!optional (xref-string (gentext-xref-strings target))) 
  ;; 다음은 'in'과 `chapter 1'의 위치를 바꾸고 빈칸을 없애 
  ;; '1장의' 형태를 만들어 줍니다.
  ;; 따라서 '1장의 "제목" 절' 형식으로 변환됩니다.
  ;; 소스는 common/dbcommon.dsl 입니다.
  (let ((source (current-node))
	(cont-blok (ancestor-member target (block-element-list)))
	(cont-sect (ancestor-member target (section-element-list)))
	(cont-comp (ancestor-member target (component-element-list)))
	(cont-divn (ancestor-member target (division-element-list)))
	(cont-book (ancestor-member target (book-element-list))))
    (make sequence
      (if (or (node-list=? cont-blok 
			   (ancestor-member source (block-element-list)))
	      (node-list=? cont-blok target)
	      (not (auto-xref-indirect? target cont-blok)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-blok))
      (if (or (node-list=? cont-sect 
			   (ancestor-member source (section-element-list)))
	      (node-list=? cont-sect target)
	      (not (auto-xref-indirect? target cont-sect)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-sect))
      (if (or (node-list=? cont-comp 
			   (ancestor-member source (component-element-list)))
	      (node-list=? cont-comp target)
	      (not (auto-xref-indirect? target cont-comp)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-comp))
      (if (or (node-list=? cont-divn 
			   (ancestor-member source (division-element-list)))
	      (node-list=? cont-divn target)
	      (not (auto-xref-indirect? target cont-divn)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-divn))
      (if (or (node-list=? cont-book 
			   (ancestor-member source (book-element-list)))
	      (node-list=? cont-book target)
	      (not (auto-xref-indirect? target cont-book)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-book))
      (auto-xref-direct target xref-string)
)))

(define ($component-title$)
  ;; part, chapter, section의 경우에 출력되는 순서를 바꿔
  ;; '1부' '1장' '1절' 형태가 되도록 하는 부분입니다. 그 밖에 
  ;; appendix 같은 경우는 그대로 '부록 A' 형식으로 나오게 됩니다.
  ;; 소스는 print/dbcompon.dsl 입니다.
  (let* ((info (cond
		((equal? (gi) (normalize "appendix"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "article"))
		 (node-list-filter-by-gi (children (current-node))
					 (list (normalize "artheader")
					       (normalize "articleinfo"))))
		((equal? (gi) (normalize "bibliography"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "chapter"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "dedication")) 
		 (empty-node-list))
		((equal? (gi) (normalize "glossary"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "index"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "preface"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "reference"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "setindex"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		(else
		 (empty-node-list))))
	 (exp-children (if (node-list-empty? info)
			   (empty-node-list)
			   (expand-children (children info) 
					    (list (normalize "bookbiblio") 
						  (normalize "bibliomisc")
						  (normalize "biblioset")))))
	 (parent-titles (select-elements (children (current-node)) (normalize "title")))
	 (info-titles   (select-elements exp-children (normalize "title")))
	 (titles        (if (node-list-empty? parent-titles)
			    info-titles
			    parent-titles))
	 (subtitles     (select-elements exp-children (normalize "subtitle"))))
    (make sequence
      (make paragraph
	font-family-name: %title-font-family%
	font-weight: 'bold
	font-size: (HSIZE 4)
	line-spacing: (* (HSIZE 4) %line-spacing-factor%)
	space-before: (* (HSIZE 4) %head-before-factor%)
	start-indent: 0pt
	first-line-start-indent: 0pt
	quadding: %component-title-quadding%
	heading-level: (if %generate-heading-level% 1 0)
	keep-with-next?: #t
	(if (string=? (element-label) "")
	    (empty-sosofo)
	    ;; 여기서 part와 chaper, section의 출력 순서를 바꿉니다.
	    (if  (or (equal? (gi) (normalize "part"))
		     (equal? (gi) (normalize "chapter"))
		     (equal? (gi) (normalize "section")))
		 (literal (element-label)
			  (gentext-element-name (current-node))
			  (gentext-label-title-sep (gi)))
		 (literal (gentext-element-name-space (current-node))
			  (element-label)
			  (gentext-label-title-sep (gi)))))
	(if (node-list-empty? titles)
	    (element-title-sosofo)
	    (with-mode component-title-mode
	      (make sequence
		(process-node-list titles)))))
      (make paragraph
	font-family-name: %title-font-family%
	font-weight: 'bold
	font-posture: 'italic
	font-size: (HSIZE 3)
	line-spacing: (* (HSIZE 3) %line-spacing-factor%)
	space-before: (* 0.5 (* (HSIZE 3) %head-before-factor%))
	space-after: (* (HSIZE 4) %head-after-factor%)
	start-indent: 0pt
	first-line-start-indent: 0pt
	quadding: %component-subtitle-quadding%
	keep-with-next?: #t
	(with-mode component-title-mode
	  (make sequence
	    (process-node-list subtitles)))))))

(mode hf-mode
  (element title
    ;; 각 페이지 상단에 나오는 제목 부분에서 '1장' 형식을
    ;; 만듭니다.
    ;; 소스는 print/dbcompon.dsl 입니다.
    (let* ((component (ancestor-member (current-node) 
				       (component-element-list)))
	   (chap (equal? (gi component) (normalize "chapter")))
	   (app (equal? (gi component) (normalize "appendix"))))
      (if %chap-app-running-heads%
	  (make sequence
	    ; 여기서 출력 순서를 바꿉니다.
	    (if (and chap
		     %chapter-autolabel%
		     (or %chap-app-running-head-autolabel%
			 (attribute-string (normalize "label") component)))
		(literal (element-label component)
			 (gentext-element-name component)
			 (gentext-label-title-sep (gi component)))
		(empty-sosofo))
	    (if (and app
		     %chapter-autolabel%
		     (or %chap-app-running-head-autolabel%
			 (attribute-string (normalize "label") component)))
		(literal (gentext-element-name-space component)
			 (element-label component) 
			 (gentext-label-title-sep (gi component)))
		(empty-sosofo))
	    (process-children-trim))
	  (empty-sosofo))))

  (element titleabbrev
    (if %chap-app-running-heads%
	(make sequence
	  (if (have-ancestor? (normalize "chapter"))
	      (literal (element-label (parent))
		       (gentext-element-name (parent))
		       (gentext-label-title-sep (gi (parent))))
	      (empty-sosofo))
	  (if (have-ancestor? (normalize "appendix"))
	      (literal (gentext-element-name-space (parent))
		       (element-label (parent))
		       (gentext-label-title-sep (gi (parent))))
	      (empty-sosofo))
	  (process-children-trim))
	(empty-sosofo)))

  (element refentrytitle
    (if %chap-app-running-heads%
	(process-children-trim)
	(empty-sosofo)))

  (element refdescriptor
    (if %chap-app-running-heads%
	(process-children-trim)
	(empty-sosofo)))

  (element refname
    (if %chap-app-running-heads%
	(process-children-trim)
	(empty-sosofo)))

  (element graphic
    (empty-sosofo))

  (element inlinegraphic
    (empty-sosofo))
)

</style-specification-body>
</style-specification>
<style-specification id="html" use="docbook">
<style-specification-body> 

 ;; ========================================
 ;;
 ;; 여기서부터는 HTML용 스타일시트 부분입니다.
 ;;
 ;; ========================================

 ;; ========================================
 ;; 
 ;; Modular DocBook Sytlesheet에서 제공하는
 ;; 여러 파라미터들의 값을 설정합니다.  이 부분은 
 ;; LDP 스타일시트를 많이 참고하였습니다(http://www.linuxdoc.org). 
 ;; 이 밖에도 무척 많은 파라미터들이 있습니다. 자세한 내용은
 ;; 스타일시트 문서를 참고하시기 바랍니다.
 ;; http://nwalsh.com/docbook/dsssl/doc/
 ;;
 ;; 이 부분의 소스는 html/dbparam.dsl 입니다. 
 ;;

(define %html-ext%
  ;; 생성된 파일의 확장명을 html로 통일합니다.
  ".html")

(define %html-header-tags% 
  ;; 브라우저에서 한글이 깨지는 경우를 방지하기 위해
  ;; 다음의 내용이 삽입됩니다.
   '(("META" ("http-equiv" "Content-Type")
             ("content" "text/html; charset=euc-kr")))
)

(define %root-filename%
  ;; 첫번째 페이지의 파일명은 index로 통일합니다.
  "index")

(define (toc-depth nd)
  ;; '차례'의 깊이를 설정합니다.
  4)

(define %generate-article-toc%
  ;; article에서 차례가 나오도록 할 것인지를 결정합니다.
  ;; 기본값은 차례가 나오지 않도록 되어 있습니다(#f). 
  ;; book의 경우에는 차례가 나오는 것이 기본값입니다.
  #t)

(define %graphic-default-extension% 
  ;; graphic 기초요소의 fileref 속성에서,
  ;; %graphic-extensions%에서 지정한 확장명이 붙지 않은 그림 
  ;; 파일 이름이 있으면 자동으로 이곳에 제시된 확장명을 사용합니다. 
  ;; 이 기능은 그림이 든 문서를 여러가지 형태로 변환할 때 유용합니다.
  ;; #f로 값을 주면 이 기능은 작동하지 않게 됩니다.
  #f)

(define %graphic-extensions% 
  ;; graphic 기초요소의 fileref 속성에 사용될
  ;; 그림 파일의 확장명을 나열합니다.
  '("eps" "epsf" "gif" "tif" "tiff" "jpg" "jpeg" "png"))

(define %generate-legalnotice-link%
  ;; 법적 공지(legalnotice)에 한 페이지를 따로 할애할 
  ;; 것인지 결정합니다.
  #f)

(define %admon-graphics%
  ;; caution이나 warning 등을 그림 아이콘을 사용해 표현할 것인지
  ;; 결정합니다. 
  #f)

(define %admon-graphics-path%
  ;; %admon-graphics%에서 사용할 그림 파일의 경로를 지정합니다.
  "../images/")

(define %generate-part-toc%
  ;; part에서 차례를 생성할지 결정합니다.
  #t)

(define %shade-verbatim%
  ;; programlisting 같은 verbatim 환경에서는
  ;; 배경을 어둡게 해줍니다.
  #t)

(define %use-id-as-filename%
  ;; id 속성의 값은 각 파일의 이름이 됩니다.
  #t)

(define %section-autolabel%
  ;; 제목에 1.1.1. 과 같은 형식의 번호 매김을 합니다.
  #t)

(define %callout-graphics%
  ;; calloutlist에 그림 원문자를 사용하지 않습니다.
  #f)

(define %funcsynopsis-decoration%
  ;; funcsynopsis를 보기 좋게 해줍니다.
  #t)

 ;; ======================================
 ;;
 ;; 스타일시트의 파라미터는 아니지만 몇가지 문제점을
 ;; 피해가기 위해 수정하는 부분입니다.

(declare-characteristic preserve-sdata?
  ;; character entity가 그대로 출력되어 버리는 문제를 해결해 줍니다.
  ;; 이 문제점은 김현수(polsci@hitel.net)님이 지적해 주셨습니다.
  "UNREGISTERED::James Clark//Characteristic::preserve-sdata?"
  #f)

(define (chunk-skip-first-element-list)
  ;; aticle에서 첫번째 절이 title page에 붙어 나오지 않도록 합니다.
  '())

(define (list-element-list)
  ;; 차례가 생성될 때 불필요한 군더더기가 붙는 버그를 피해갑니다.
  '())


 ;; =======================================
 ;;
 ;; 여기서부터는 좀더 자연스러운 한글 표현을 위해
 ;; Modular DocBook Stylesheet의 HTML 부분을 수정합니다.
 ;;

(element emphasis 
  ;; emphasis를 무조건 굵은 글씨체로 표현하도록 합니다.
  ;; 기본값은 이탤릭체입니다.
  ;; 이 부분은 Chung, Ha-Nyung(alita@kldp.org)님이
  ;; 지적해 주셨습니다.
  ;; 소스는 html/dbinline.dsl 입니다.
  ($bold-seq$))

(define (article-titlepage-recto-elements)
  ;; article의 첫 페이지에서 나타날 기초요소들을
  ;; 지정합니다. editor와 othercredit이 추가되었습니다.
  ;; 소스는 html/dbttlpg.dsl 입니다.
  (list (normalize "title")
	(normalize "subtitle")
	(normalize "corpauthor")
	(normalize "authorgroup")
	(normalize "author")
	(normalize "editor")
	(normalize "othercredit")
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "abstract")
	(normalize "legalnotice")
	(normalize "revhistory")
	(normalize "releaseinfo")
))

(define (book-titlepage-recto-elements)
  ;; book의 첫 페이지에서 나타날 기초요소들을
  ;; 지정합니다. editor와 othercredit이 추가되었습니다.
  ;; 소스는 html/dbttlpg.dsl 입니다.
  (list (normalize "title")
	(normalize "subtitle")
	(normalize "graphic")
	(normalize "mediaobject")
	(normalize "corpauthor")
	(normalize "authorgroup")
	(normalize "author")
	(normalize "editor")
	(normalize "othercredit")	
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "abstract")
	(normalize "legalnotice")
	(normalize "revhistory")
	(normalize "releaseinfo")
))

(mode book-titlepage-recto-mode

  (element editor
    ;; book의 첫 페이지에서 editor가 어떻게 보여지도록 할지 묘사합니다.
    ;; 소스는 html/dbttlpg.dsl 입니다.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang 속성에 상관없이 'edited by'를 
	;; '엮은이'로 나오게 합니다. 
	;; KLDP에서는 'edited by'를 명시하지 않는 것을
	;; 원칙으로 하고 있으므로 이부분이 출력되지 않도록 
	;; 주석처리하였습니다.
	;; (if (first-sibling?) 
	;;     (make element gi: "H4"
	;;           attributes: (list (list "CLASS" "EDITEDBY"))
	;;           (literal "\U-C5EE;\U-C740;\U-C774;"))
	;;     (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      (literal editor-name))
              (process-node-list editor-affil))))

 (element contrib
    ;; othercredit을 위해 사용되는 contrib이 어떻게 보여지도록 할지
    ;; 묘사합니다.
    (make sequence
      (make element gi: "SPAN"
            attributes: (list (list "CLASS" (gi)))
            (process-children))))

  (element othercredit
    ;; book의 첫 페이지에서 othercredit가 어떻게 보여지도록 할지 
    ;; 묘사합니다.
    (let ((credit-name (author-string))
	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib")))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang 속성에 상관없이 othercredit를 
	;; `도운이'로 나오게 합니다. 
	;; KLDP에서는 othercredit를 명시하지 않는 것을
	;; 원칙으로 하고 있으므로 이부분이 출력되지 않도록 
	;; 주석처리하였습니다.
	;;	(if (first-sibling?) 
	;;	    (make element gi: "H4"
	;;		  attributes: (list (list "CLASS" "EDITEDBY"))
	;;		  (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	;;	    (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      ;; othercredit의 contrib이 나오도록 합니다.  
	      (literal credit-name))
	      (process-node-list credit-contrib)
              (process-node-list credit-affil))))

)

(mode article-titlepage-recto-mode
  (element editor
    ;; article의 첫 페이지에서 editor가 어떻게 보여지도록 할지 
    ;; 묘사합니다.
    ;; 소스는 html/dbttlpg.dsl 입니다.
    (let ((editor-name (author-string))
	  (editor-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang 속성에 상관없이 'edited by'를 '엮은이'로
	;; 나오도록 합니다.
	;; KLDP에서는 'edited by'를 명시하지 않은 것을 원칙으로
	;; 하므로 이 부분을 주석 처리하였습니다.
	;;	(if (first-sibling?) 
	;;	    (make element gi: "H4"
	;;		  attributes: (list (list "CLASS" "EDITEDBY"))
	;;		  (literal "\U-C5EE;\U-C740;\U-C774;"))
	;;	    (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      (literal editor-name))
              (process-node-list editor-affil))))

 (element contrib
    ;; othercredit을 위해 사용되는 contrib이 어떻게 보여지도록 할지
    ;; 묘사합니다.
    (make sequence
      (make element gi: "SPAN"
            attributes: (list (list "CLASS" (gi)))
            (process-children))))

  (element othercredit
    ;; article의 첫 페이지에서 othercredit가 어떻게 보여지도록 할지 
    ;; 묘사합니다.
    (let ((credit-name (author-string))
	  (credit-contrib (select-elements (children (current-node))
                                            (normalize "contrib")))
	  (credit-affil (select-elements (children (current-node)) 
					 (normalize "affiliation"))))
      (make sequence
	;; lang 속성에 상관없이 othercredit을 '도운이'로
	;; 나오게 합니다.
	;; KLDP에서는 othercredit을 명시하지 않은 것을 기본으로
	;; 하므로 이 부분을 주석처리하였습니다.
	;;	(if (first-sibling?) 
	;;	    (make element gi: "H4"
	;;		  attributes: (list (list "CLASS" "EDITEDBY"))
	;;		  (literal "\U-B3C4;\U-C6B4;\U-C774;"))
	;;	    (empty-sosofo))
	(make element gi: "H3"
	      attributes: (list (list "CLASS" (gi)))
	      ;; othercredit의 contrib이 나오도록 합니다.
	      (literal credit-name))
	      (process-node-list credit-contrib)
              (process-node-list credit-affil))))

)

(define (titlepage-recto-copyright #!optional (node (current-node)))
  ;; lang 속성에 상관없이 저작권 정보를 영문 형태로
  ;; 표기합니다.
  ;; 소스는 html/dbttlpg.dsl 입니다.
  (let ((years (select-elements (descendants node)
				(normalize "year")))
	(holders (select-elements (descendants node)
				  (normalize "holder")))
	(legalnotice (select-elements (children (parent node))
				      (normalize "legalnotice"))))
    (make element gi: "P"
	  attributes: (list
		       (list "CLASS" (gi)))
	  (if (and %generate-legalnotice-link%
		   (not nochunks)
		   (not (node-list-empty? legalnotice)))
	      (make sequence
		(make element gi: "A"
		      attributes: (list 
				   (list "HREF" 
					 ($legalnotice-link-file$
					  (node-list-first legalnotice))))
		      (literal "Copyright"))
		(literal " ")
		(dingbat-sosofo "copyright")
		(literal " ")
		(process-node-list years)
		(literal (string-append " " "by" " "))
		(process-node-list holders))
	      (make sequence
		(literal "Copyright")
		(literal " ")
		(dingbat-sosofo "copyright")
		(literal " ")
		(process-node-list years)
		(literal (string-append " " "by" " "))
		(process-node-list holders))))))

(define (auto-xref-indirect target 
			    #!optional
			    (xref-string (gentext-xref-strings target)))
  ;; 참조를 '1장의 "제목" 절' 형식으로 표현하기 위한 부분입니다.
  ;; 원형은 'the section called "title" in chaper 1' 형식입니다.
  ;; common/dbl1ko.dsl에서 'the section called "title"'은
  ;; '"제목" 절'로, 'in'은 '의'로 대응되어 있습니다.
  ;;
  ;; 여기서는 'the section called "title"' 부분과
  ;; 'in chapter 1' 부분을 뒤바꾸어 
  ;; '의 1장 "제목" 절' 형태로 만들어 줍니다.
  ;; 소스는 common/dbcommon.dsl 입니다.
  (make sequence
    (auto-xref-direct target xref-string)
    (auto-xref-indirect-connector target)))

(define (auto-xref target 
		   #!optional (xref-string (gentext-xref-strings target)))
  ;; 다음은 'in'과 'chapter 1'의 위치를 바꾸고 빈칸을 없애 
  ;; '1장의' 형태를 만들어 줍니다.
  ;; 따라서 '1장의 "제목" 절' 형식으로 변환됩니다.
  ;; 소스는 common/dbcommon.dsl 입니다.
  (let ((source (current-node))
	(cont-blok (ancestor-member target (block-element-list)))
	(cont-sect (ancestor-member target (section-element-list)))
	(cont-comp (ancestor-member target (component-element-list)))
	(cont-divn (ancestor-member target (division-element-list)))
	(cont-book (ancestor-member target (book-element-list))))
    (make sequence
      (if (or (node-list=? cont-blok 
			   (ancestor-member source (block-element-list)))
	      (node-list=? cont-blok target)
	      (not (auto-xref-indirect? target cont-blok)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-blok))
      (if (or (node-list=? cont-sect 
			   (ancestor-member source (section-element-list)))
	      (node-list=? cont-sect target)
	      (not (auto-xref-indirect? target cont-sect)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-sect))
      (if (or (node-list=? cont-comp 
			   (ancestor-member source (component-element-list)))
	      (node-list=? cont-comp target)
	      (not (auto-xref-indirect? target cont-comp)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-comp))
      (if (or (node-list=? cont-divn 
			   (ancestor-member source (division-element-list)))
	      (node-list=? cont-divn target)
	      (not (auto-xref-indirect? target cont-divn)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-divn))
      (if (or (node-list=? cont-book 
			   (ancestor-member source (book-element-list)))
	      (node-list=? cont-book target)
	      (not (auto-xref-indirect? target cont-book)))
	  (empty-sosofo)
	  (auto-xref-indirect cont-book))
      (auto-xref-direct target xref-string)
)))

(define ($component-title$ #!optional (titlegi "H1") (subtitlegi "H2"))
  ;; part, chapter, section의 경우에 출력되는 순서를 바꿔
  ;; '1부' '1장' '1절' 형태가 되도록 하는 부분입니다. 그 밖에 
  ;; appendix 같은 경우는 그대로 '부록 A' 형식으로 나오게 됩니다.
  ;; 소스는 html/dbcompon.dsl 입니다.
  (let* ((info (cond
		((equal? (gi) (normalize "appendix"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "article"))
		 (node-list-filter-by-gi (children (current-node))
					 (list (normalize "artheader")
					       (normalize "articleinfo"))))
		((equal? (gi) (normalize "bibliography"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "chapter"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "dedication"))
		 (empty-node-list))
		((equal? (gi) (normalize "glossary"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "index"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "preface"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "reference"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		((equal? (gi) (normalize "setindex"))
		 (select-elements (children (current-node)) (normalize "docinfo")))
		(else
		 (empty-node-list))))
	 (exp-children (if (node-list-empty? info)
			   (empty-node-list)
			   (expand-children (children info) 
					    (list (normalize "bookbiblio") 
						  (normalize "bibliomisc")
						  (normalize "biblioset")))))
	 (parent-titles (select-elements (children (current-node)) (normalize "title")))
	 (info-titles   (select-elements exp-children (normalize "title")))
	 (titles        (if (node-list-empty? parent-titles)
			    info-titles
			    parent-titles))
	 (subtitles     (select-elements exp-children (normalize "subtitle"))))
    (make sequence
      (make element gi: titlegi
	    (make element gi: "A"
		  attributes: (list (list "NAME" (element-id)))
		  ;; 여기서 part와 chaper, section의 출력 순서를 바꿉니다.
		  (if (and %chapter-autolabel%
			   (or (equal? (gi) (normalize "part"))
			       (equal? (gi) (normalize "chapter"))
			       (equal? (gi) (normalize "section"))))
		      (literal (element-label (current-node))
			       (gentext-element-name (gi))
			       (gentext-label-title-sep (gi)))
		      (empty-sosofo))
		  (if (and %chapter-autolabel%
			   (or (equal? (gi) (normalize "appendix"))))
		      (literal (gentext-element-name-space (gi))
			       (element-label (current-node))
			       (gentext-label-title-sep (gi)))
		      (empty-sosofo))
		  (if (node-list-empty? titles)
		      (element-title-sosofo)
		      (with-mode title-mode
			(process-node-list titles)))))
      (if (node-list-empty? subtitles) 
	  (empty-sosofo)
	  (with-mode subtitle-mode
	    (make element gi: subtitlegi
		  (process-node-list subtitles)))))))

(define (nav-context-sosofo elemnode)
  ;; 각 페이지 상단에 나오는 제목 부분에서 '1장' 형식을
  ;; 만듭니다.
  ;; 소스는 html/navig.dsl 입니다.
  (let* ((component     (ancestor-member elemnode
					 (append (book-element-list)
						 (division-element-list)
						 (component-element-list))))
	 (context-text  (inherited-dbhtml-value elemnode "context-text")))
    (if (and context-text (not (string=? context-text "")))
	(literal context-text)
	(if (equal? (element-label component) "")
	    (make sequence
	      (element-title-sosofo component))

	    (if (equal? (gi component) (normalize "chapter"))
		(make sequence
		  (element-label-sosofo component)
		  (if (and (equal? (gi component) (normalize "appendix"))
			   (or (equal? (gi elemnode) (normalize "sect1"))
			       (equal? (gi elemnode) (normalize "section")))
			   (equal? (gi (parent component)) (normalize "article")))
		      (empty-sosofo)
		      (literal (gentext-element-name (gi component))))
		  (literal (gentext-label-title-sep (gi component)))
		  (element-title-sosofo component))
		(make sequence
		  (if (and (equal? (gi component) (normalize "appendix"))
			   (or (equal? (gi elemnode) (normalize "sect1"))
			       (equal? (gi elemnode) (normalize "section")))
			   (equal? (gi (parent component)) (normalize "article")))
		      (empty-sosofo)
		      (literal (gentext-element-name-space (gi component))))
		  (element-label-sosofo component)
		  (literal (gentext-label-title-sep (gi component)))
		  (element-title-sosofo component)))))))

;; (define ($informal-object$ #!optional (rule-before? #f) (rule-after? #f))
;;   ;; informal object의 align 속성을 사용할 수 있도록 해줍니다.
;;   ;; 이를 통해 그림이나 표의 위치를 왼쪽, 오른쪽, 중앙으로 정렬할 수
;;   ;; 있습니다.
;;   ;; 이 부분은 Kang, Joonsun(bigbear@ece.skku.ac.kr)님이 보내 
;;   ;; 주셨습니다.
;;   (let ((id (element-id)))
;;     (cond                                           
;;      ((equal? (attribute-string "role") "center")       
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "CLASS" (gi))
;; 			 (list "ALIGN" "CENTER"))                
;; 	 (if id
;; 	     (make element gi: "A"
;; 		   attributes: (list (list "NAME" id))
;; 		   (empty-sosofo))
;; 	     (empty-sosofo))
;; 	 (if %spacing-paras%
;; 	     (make element gi: "P" (empty-sosofo))
;; 	     (empty-sosofo))
;; 	 (if rule-before?
;; 	     (make empty-element gi: "HR")
;; 	     (empty-sosofo))
;; 	 (process-children)
;; 	 (if rule-after?
;; 	     (make empty-element gi: "HR")
;; 	     (empty-sosofo))
;; 	 (if %spacing-paras%
;; 	     (make element gi: "P" (empty-sosofo))
;; 	     (empty-sosofo))))
;;      ((equal? (attribute-string "role") "left")   
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "CLASS" (gi))
;; 			 (list "ALIGN" "LEFT"))         
;; 	    (if id
;; 		(make element gi: "A"
;; 		      attributes: (list (list "NAME" id))
;; 		      (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if rule-before?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (process-children)
;; 	    (if rule-after?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))))
;;      ((equal? (attribute-string "role") "right")    
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "CLASS" (gi))
;; 			 (list "ALIGN" "RIGHT"))             
;; 	    (if id
;; 		(make element gi: "A"
;; 		      attributes: (list (list "NAME" id))
;; 		      (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if rule-before?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (process-children)
;; 	    (if rule-after?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))))
;;      (else                                    
;;       (make element gi: "DIV"
;; 	    attributes: (list
;; 			 (list "ALIGN" "CENTER"))    
;; 	    (if id
;; 		(make element gi: "A"
;; 		      attributes: (list (list "NAME" id))
;; 		      (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))
;; 	    (if rule-before?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (process-children)
;; 	    (if rule-after?
;; 		(make empty-element gi: "HR")
;; 		(empty-sosofo))
;; 	    (if %spacing-paras%
;; 		(make element gi: "P" (empty-sosofo))
;; 		(empty-sosofo))))
;; )))
;;

;; (mode book-titlepage-recto-mode
;;   ;; address 안에서 email에 하이퍼 링크를 가능하도록 해줍니다.
;;   ;; 이 부분은 Kang, Joonsun(bigbear@ece.skku.ac.kr)님이 보내 
;;   ;; 주셨습니다.
;;   (element address
;;     (make element gi: "P"
;;       (make element gi: "PRE"
;;          attributes: (list (list "CLASS" (gi))))))
;; )

(define (gentext-ko-nav-prev prev)
  (make sequence (literal "이전")))
(define (gentext-ko-nav-next next)
  (make sequence (literal "다음")))
(define (gentext-ko-nav-up up)
  (make sequence (literal "위로")))
(define (gentext-ko-nav-home home)
  (make sequence (literal "홈")))

(define %stylesheet% "kldp.css") ;; kldp.css정의 wkpark @ kldp.org
(define ($table-width$) "600")
(define ($shade-verbatim-attr$)
  ;; REFENTRY shade-verbatim-attr
  ;; PURP Attributes used to create a shaded verbatim environment.
  ;; DESC
  ;; See '%shade-verbatim%'
  ;; /DESC
  ;; AUTHOR N/A
  ;; /REFENTRY
  (list
   (list "BORDER" "0")
   (list "ALIGN" "CENTER")
   (list "CELLPADDING" "0")
   (list "BGCOLOR" "#D1D1D7")
   (list "WIDTH" "600")))

</style-specification-body>
</style-specification>
<external-specification id="docbook" document="docbook.dsl">
</style-sheet>

