style"gtknotebook"{
xthickness=3
ythickness=2
GtkNotebook::tab-curvature=3
GtkNotebook::tab-overlap=3
engine"pixmap"{
image{
function=SHADOW
file="images/notebook.png"
border={4,4,4,4}
stretch=TRUE}
image{
function=BOX
file="images/notebook.png"
border={4,4,4,4}
stretch=TRUE}
image{
function=BOX_GAP
recolorable=TRUE
file="images/notebooktop.png"
detail="notebook"
border={4,4,4,4}
stretch=TRUE
gap_file="images/tabhorizgap.png"
gap_border={3,3,0,0}
gap_start_file="images/tabhorizgapstart.png"
gap_start_border={2,0,0,0}
gap_end_file="images/tabhorizgapend.png"
gap_end_border={0,2,0,0}
gap_side=TOP}
image{
function=EXTENSION
state=ACTIVE
file="images/tabtopunselected.png"
border={3,3,1,1}
stretch=TRUE
gap_side=BOTTOM}
image{
function=EXTENSION
file="images/tabtopunselected.png"
border={3,3,3,1}
stretch=TRUE
overlay_file="images/tabtop.xpm"
overlay_border={3,3,3,1}
overlay_stretch=TRUE
gap_side=BOTTOM}
image{
function=BOX_GAP
recolorable=TRUE
file="images/notebookbottom.png"
detail="notebook"
border={4,4,4,4}
stretch=TRUE
gap_file="images/tabhorizgap.png"
gap_border={3,3,0,0}
gap_start_file="images/tabhorizgapstart.png"
gap_start_border={2,0,0,0}
gap_end_file="images/tabhorizgapend.png"
gap_end_border={0,2,0,0}
gap_side=BOTTOM}
image{
function=EXTENSION
state=ACTIVE
file="images/tabbottomunselected.png"
border={3,3,1,3}
stretch=TRUE
gap_side=TOP}
image{
function=EXTENSION
file="images/tabbottomunselected.png"
border={3,3,1,3}
stretch=TRUE
overlay_file="images/tabbottom.xpm"
overlay_border={3,3,1,3}
overlay_stretch=TRUE
gap_side=TOP}
image{
function=BOX_GAP
recolorable=TRUE
file="images/notebookleft.png"
detail="notebook"
border={4,4,4,4}
stretch=TRUE
gap_file="images/tabvertgap.png"
gap_border={0,0,3,3}
gap_start_file="images/tabvertgapstart.png"
gap_start_border={0,0,0,2}
gap_end_file="images/tabvertgapend.png"
gap_end_border={0,0,2,0}
gap_side=LEFT}
image{
function=EXTENSION
state=ACTIVE
file="images/tableftunselected.png"
border={1,3,3,3}
stretch=TRUE
gap_side=RIGHT}
image{
function=EXTENSION
file="images/tableftunselected.png"
border={3,1,3,3}
stretch=TRUE
overlay_file="images/tableft.xpm"
overlay_border={3,1,3,3}
overlay_stretch=TRUE
gap_side=RIGHT}
image{
function=BOX_GAP
recolorable=TRUE
file="images/notebookright.png"
detail="notebook"
border={4,4,4,4}
stretch=TRUE
gap_file="images/tabvertgap.png"
gap_border={0,0,3,3}
gap_start_file="images/tabvertgapstart.png"
gap_start_border={0,0,0,2}
gap_end_file="images/tabvertgapend.png"
gap_end_border={0,0,2,0}
gap_side=RIGHT}
image{
function=EXTENSION
state=ACTIVE
file="images/tabrightunselected.png"
border={3,3,3,3}
stretch=TRUE
gap_side=LEFT}
image{
function=EXTENSION
file="images/tabrightunselected.png"
border={3,3,3,3}
stretch=TRUE
overlay_file="images/tabright.xpm"
overlay_border={1,3,3,3}
overlay_stretch=TRUE
gap_side=LEFT}}}
class"GtkNotebook"style"gtknotebook"

style"notebooklabel"{
#font_name="bold"
fg[NORMAL]=@fg_color
fg[ACTIVE]=shade(0.5,@fg_color)
engine"mist"{}}
widget_class"*.<GtkNotebook><GtkLabel>"style"notebooklabel"
