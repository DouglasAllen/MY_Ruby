require 'tk'
require 'tkextlib/tile'

root = TkRoot.new { title "root" }
toplevel = TkToplevel.new { title "toplevel" }

#~ button = Tk::Tile::TButton.new(root) {text "Hello World"}.grid

#~ variable = TkVariable.new(toplevel) {text "Hello World"}
#~ p variable

mycheck = TkVariable.new(toplevel)
#~ p mycheck

font = TkFont.new()
#~ p font

menubar = TkMenubar.new(toplevel)
#~ p menubar

checkbutton = TkCheckButton.new(root) {
  variable mycheck
  pack('padx'=>5, 'pady'=>5, 'side' => 'left')
}

button = TkButton.new(toplevel){
  text "Ok"
  command proc { p mycheck.value; exit }
  pack('side'=>'left', 'padx'=>10, 'pady'=>10)
}

#~ p button

canvas = TkCanvas.new()
#~ p canvas



#~ p checkbutton

entry = TkEntry.new()
#~ p entry

frame = TkFrame.new()
#~ p frame

label = TkLabel.new()
#~ p label

labelframe = TkLabelframe.new()
#~ p labelframe

listbox = TkListbox.new()
#~ p listbox

menu = TkMenu.new()
#~ p menu

menubutton = TkMenubutton.new()
#~ p menubutton

message = TkMessage.new()
#~ p message

panedwindow = TkPanedwindow.new()
#~ p panedwindow

radiobutton = TkRadioButton.new()
#~ p radiobutton

scale = TkScale.new()
#~ p scale

scrollbar = TkScrollbar.new()
#~ p scrollbar

sizegrip = TkSizegrip.new()
#~ p sizegrip

spinbox = TkSpinbox.new()
#~ p spinbox

text = TkText.new()
#~ p text

combobox = TkCombobox.new()
#~ p combobox

notebook = TkNotebook.new()
#~ p notebook

progressbar = TkProgressbar.new()
#~ p progressbar

separator = TkSeparator.new()
#~ p separator

treeview = TkTreeview.new()
#~ p treeview

Tk.mainloop()