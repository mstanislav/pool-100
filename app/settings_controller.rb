class SettingsController < UIViewController
  attr_accessor :window

  def viewDidLoad
    self.view.backgroundColor = UIColor.underPageBackgroundColor
    name_input
  end

  def name_input
    name_input_label = UILabel.new
    name_input_label.font = UIFont.systemFontOfSize(26)
    name_input_label.text = "What is your name?"
    name_input_label.textAlignment = UITextAlignmentCenter
    name_input_label.textColor = UIColor.blackColor
    name_input_label.backgroundColor = UIColor.clearColor
    name_input_label.frame = [[10, 5], [250, 40]]
    view.addSubview(name_input_label)

    @name_input = add_text_field(frame: [[10, 45], [230, 30]])
    @name_input.delegate = self
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.addTarget(self, action:"set_name", forControlEvents: UIControlEventTouchDown)
    button.setTitle('Save', forState: UIControlStateNormal)
    button.frame = CGRectMake(265, 45, 50, 30)
    view.addSubview(button)
  end

  def set_name
    $name = @name_input.text != '' ? @name_input.text : 'Lucky Player'
    $name_label.text = "Hi, #{$name}"
    @name_input.resignFirstResponder
  end

  def textFieldShouldReturn(text_field)
    set_name unless text_field != @name_input
  end

private
  def add_text_field(params)
    text_field = UITextField.new
    text_field.font = UIFont.systemFontOfSize(20)
    text_field.text = $name
    text_field.textAlignment = UITextAlignmentCenter
    text_field.textColor = UIColor.blackColor
    text_field.backgroundColor = UIColor.whiteColor
    text_field.borderStyle = UITextBorderStyleRoundedRect
    text_field.keyboardType = params[:keyboardType] if params[:keyboardType]
    text_field.frame = params[:frame]
    view.addSubview(text_field)
    text_field
  end
end
