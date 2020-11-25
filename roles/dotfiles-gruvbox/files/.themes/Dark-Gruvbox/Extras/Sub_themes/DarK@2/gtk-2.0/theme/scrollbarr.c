style"scrollbar"{
xthickness=0
ythickness=0
GtkScrollbar::slider_width = 48
GtkScrollbar::min-slider-length=160
GtkRange::trough-border=4
GtkRange::stepper-size=32
GtkRange::activate-slider=1}
class"GtkScrollbar"style"scrollbar"

style"scrollbarbase"{
bg[ACTIVE]=shade(0.70,@bg_color)}
class"GtkVScrollbar"style"scrollbarbase"
class"GtkHScrollbar"style"scrollbarbase"

style"scrollbarpressed"{
engine"pixmap"{
image{
function=BOX
state=NORMAL
detail="slider"
file="images/scrollbarnormal.png"
border={4,4,4,4}
stretch=TRUE}
image{
function=BOX
state=PRELIGHT
detail="slider"
file="images/scrollbarnormal.png"
border={4,4,4,4}
stretch=TRUE}
image{
function=BOX
state=SELECTED
detail="slider"
file="images/scrollbarnormal.png"
border={4,4,4,4}
stretch=TRUE}
image{
function=BOX
state=INSENSITIVE
detail="slider"
file="images/scrollbarnormal.png"
border={4,4,4,4}
stretch=TRUE}
image{
function=BOX
state=ACTIVE
detail="slider"
file="images/scrollbarnormal.png"
border={4,4,4,4}
stretch=TRUE
overlay_file="images/scrollbarpressed.xpm"
overlay_border={4,4,4,4}
overlay_stretch=TRUE}}}
class"GtkScrollbar"style"scrollbarpressed"
