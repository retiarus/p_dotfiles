style"scrolledwindow"{
xthickness=3
ythickness=3
GtkScrolledWindow::scrollbar-spacing=0
GtkScrolledWindow::scrollbars-within-bevel=1
bg[NORMAL]=shade(0.85,@bg_color)
bg[PRELIGHT]=shade(0.85,@bg_color)
bg[SELECTED]=shade(0.85,@bg_color)
bg[ACTIVE]=shade(0.85,@bg_color)
bg[INSENSITIVE]=shade(0.85,@bg_color)
engine"pixmap"{
image{
function=SHADOW
shadow=IN
file="images/scrolledwindowshadow.png"
border={3,3,3,3}
stretch=TRUE}
image{
function=SHADOW
shadow=OUT
file="images/scrolledwindowshadow.png"
border={3,3,3,3}
stretch=TRUE}
image{
function=SHADOW
shadow=ETCHED_IN
file="images/scrolledwindowshadow.png"
border={3,3,3,3}
stretch=TRUE}
image{
function=SHADOW
shadow=ETCHED_OUT
file="images/scrolledwindowshadow.png"
border={3,3,3,3}
stretch=TRUE}
image{
function=SHADOW
shadow=NONE
file="images/none.xpm"
stretch=FALSE}}}
widget_class"*GtkScrolledWindow"style"scrolledwindow"


