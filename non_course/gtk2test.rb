require 'gtk2'
Gtk.init
vbox = Gtk::VBox.new 2
button = Gtk::Button.new 'Hello World'
entry = Gtk::Entry.new
entry.text = 'Hello?'
window = Gtk::Window.new 'A Hello World App.'
window.border_width = 5
window.add vbox
vbox.pack_start button
vbox.pack_start entry
window.show_all
Gtk.main