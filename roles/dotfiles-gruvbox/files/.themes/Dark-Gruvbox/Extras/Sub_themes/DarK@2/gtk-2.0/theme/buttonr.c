style"button"{
GtkWidget::interior-focus=1
GtkWidget::focus-line-pattern="\0"
GtkWidget::focus-line-width=0
GtkWidget::focus-padding=0
GtkButton::image-spacing=4
GtkButton::default-outside-border={0,0,0,0}
GtkButton::default-border={0,0,0,0}
GtkButton::inner-border={8,8,8,8}
GtkOptionMenu::indicator-size={32,32}
GtkOptionMenu::indicator-spacing={10,10,4,4}
bg[NORMAL]=shade(0.75,@bg_color)
bg[PRELIGHT]=shade(0.75,@bg_color)
bg[SELECTED]=shade(0.75,@bg_color)
bg[ACTIVE]=shade(0.75,@bg_color)
bg[INSENSITIVE]=@bg_color
fg[NORMAL]=@fg_color
fg[PRELIGHT]=@fg_color
fg[SELECTED]=@fg_color
fg[ACTIVE]=@fg_color
fg[INSENSITIVE]=shade(0.5,@fg_color)
engine"pixmap"{
image{
function=BOX
state=NORMAL
shadow=IN
file="images/buttonpressed.xpm"
border={8,8,2,10}
stretch=TRUE}
image{
function=BOX
state=PRELIGHT
shadow=IN
file="images/buttonpressed.xpm"
border={8,8,2,10}
stretch=TRUE}
image{
function=BOX
state=SELECTED
shadow=IN
file="images/buttonpressed.xpm"
border={8,8,2,10}
stretch=TRUE}
image{
function=BOX
state=ACTIVE
shadow=IN
file="images/buttonpressed.xpm"
border={8,8,2,10}
stretch=TRUE}
image{
function=FOCUS
file="images/focus.xpm"
border={2,2,2,2}
stretch=TRUE}}}
class"GtkButton"style"button"
class"GtkToggleButton"style"button"
class"GtkFontButton"style"button"
class"GtkColorButton"style"button"
class"GtkOptionMenu"style"button"

style"comboboxsep"{
GtkWidget::wide-separators=1
GtkWidget::separator-height=0
GtkWidget::separator-width=0}
widget"*.GtkComboBox.GtkToggleButton*GtkVSeparator"style"comboboxsep"
widget"*.GtkComboBoxText.GtkToggleButton*GtkVSeparator"style"comboboxsep"
widget"*.GtkFontButton*GtkVSeparator"style"comboboxsep"
widget"*.GtkFileChooserButton*GtkVSeparator"style"comboboxsep"
widget"*.GtkToggleButton*GtkVSeparator"style"comboboxsep"

style"toolbutton"{
bg[NORMAL]=shade(0.75,@bg_color)
bg[PRELIGHT]=@bg_color
bg[SELECTED]=shade(0.75,@bg_color)
bg[ACTIVE]=shade(0.75,@bg_color)
bg[INSENSITIVE]=@bg_color
engine"pixmap"{
image{
function=BOX
state=PRELIGHT
shadow=OUT
file="images/none.xpm"
stretch=FALSE}
image{
function=FOCUS
file="images/none.xpm"
stretch=FALSE}}}
widget_class"*.<GtkToolbar>*<GtkButton>"style"toolbutton"
widget_class"*<GtkScaleButton>"style"toolbutton"
widget_class"*<GtkVolumeButton>"style"toolbutton"
widget_class"*<GtkLinkButton>"style"toolbutton"

style"linkbutton"{
bg[NORMAL]=@bg_color
bg[PRELIGHT]=@bg_color
bg[SELECTED]=@bg_color
bg[ACTIVE]=@bg_color
bg[INSENSITIVE]=@bg_color
}widget_class"*<GtkLinkButton>*"style"linkbutton"

style"buttonlabelcolor"{
fg[NORMAL]=@fg_color
fg[PRELIGHT]=@fg_color
fg[SELECTED]=@fg_color
fg[ACTIVE]=@fg_color
fg[INSENSITIVE]=shade(0.5,@fg_color)
}widget_class"*.<GtkButton>*<GtkLabel>"style"buttonlabelcolor"

widget_class"*.<GtkButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkToggleButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkFontButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkColorButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkOptionMenu>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkScaleButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkVolumeButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkLinkButton>*<GtkLabel>"style"mistrender"
widget_class"*.<GtkButton>*<GtkImage>"style"mistrender"
widget_class"*.<GtkToggleButton>*<GtkImage>"style"mistrender"
widget_class"*.<GtkFontButton>*<GtkImage>"style"mistrender"
widget_class"*.<GtkColorButton>*<GtkImage>"style"mistrender"
widget_class"*.<GtkOptionMenu>*<GtkImage>"style"mistrender"
widget_class"*.<GtkScaleButton>*<GtkImage>"style"mistrender"
widget_class"*.<GtkVolumeButton>*<GtkImage>"style"mistrender"
widget_class"*.<GtkLinkButton>*<GtkImage>"style"mistrender"
