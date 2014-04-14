require 'fox16'

include Fox

class MyProject < FXMainWindow

  def initialize(app)
    super(app, "My Project", :width => 400)

    # Frame to contain everything
    frame = FXVerticalFrame.new(self, LAYOUT_FILL_X|LAYOUT_FILL_Y)

    # Entry/Display Layout
    layout = FXMatrix.new(frame, 2, MATRIX_BY_COLUMNS|LAYOUT_FILL_X)

    FXLabel.new(layout, "Login Id:   ", nil, LABEL_NORMAL)
    id = FXTextField.new(layout, 30, nil, 0, TEXTFIELD_NORMAL)

    FXLabel.new(layout, "Password:   ", nil, LABEL_NORMAL)
    password = FXTextField.new(layout, 30, nil, 0, TEXTFIELD_NORMAL|TEXTFIELD_PASSWD)

    FXLabel.new(layout, "Message:    ", nil, LABEL_NORMAL)
    message = FXTextField.new(layout, 30, nil, 0, TEXTFIELD_NORMAL|TEXTFIELD_READONLY)

    # Button Layout
    button_layout = FXHorizontalFrame.new(frame, PACK_UNIFORM_WIDTH|LAYOUT_CENTER_X)

    submit = FXButton.new(button_layout, "Submit", nil, nil, 0, BUTTON_NORMAL)

    cancel = FXButton.new(button_layout, "Cancel", nil, nil, 0, BUTTON_NORMAL)

    exit = FXButton.new(button_layout, "Exit", nil, nil, 0, BUTTON_NORMAL)

    # Output message on click of Submit
    submit.connect(SEL_COMMAND) do
      message.text = "Login Id and Password submitted"
    end

    # Clear fields on click of Cancel
    cancel.connect(SEL_COMMAND) do
      id.text = ""
      password.text = ""
      message.text = ""
    end

    # Exit on click of Exit
    exit.connect(SEL_COMMAND) do
      exit
    end

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

# Display app and associated windows etc.
FXApp.new do |app|
  MyProject.new(app)
  app.create
  app.run
end

