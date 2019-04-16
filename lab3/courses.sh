#!/bin/sh

wget -q -O-
"http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=All"
 "http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=All"|
grep "$1" |
grep '<A href.*>'| 
sed -e s/'^.*2017\/'//| 
sed -e s/'.html">'/' '/|
sed -e s/'[ ]*<.*$'//|
sort|
uniq|
grep '^'"$1"
