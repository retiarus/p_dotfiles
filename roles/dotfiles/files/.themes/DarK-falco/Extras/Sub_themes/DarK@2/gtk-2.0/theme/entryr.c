style"entry"{
ythickness=4
xthickness=6
base[NORMAL]=shade(0.75,@bg_color)
base[PRELIGHT]=shade(0.75,@bg_color)
base[SELECTED]=@selected_bg_color
base[ACTIVE]=@selected_bg_color
text[SELECTED]=@selected_fg_color
text[ACTIVE]=@selected_fg_color
base[INSENSITIVE]=@bg_color
engine"pixmap"{
image{
function=BOX
state=NORMAL
shadow=IN
file="images/buttonpressed.xpm"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=PRELIGHT
shadow=IN
file="images/entry.xpm"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=SELECTED
shadow=IN
file="images/entry.xpm"
border={2,2,2,2}
stretch=TRUE}
image{
function=BOX
state=ACTIVE
shadow=IN
file="images/entry.xpm"
border={2,2,2,2}
stretch=TRUE}
image{
function=FOCUS
file="images/entryfocus.xpm"
border={4,4,4,4}
stretch=TRUE}}}
class"GtkEntry"style"entry"