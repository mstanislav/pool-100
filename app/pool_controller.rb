class PoolController < UIViewController
  @@margin = 20
  @@score = 0
  @@name = 'Lucky Player'

  def viewDidLoad
    name_input
    show_name
    show_score
    show_buttons
  end

  def name_input
    @name_input = add_text_field(placeholder: 'What is your name?', frame: [[10, 25], [250, 30]])
    @name_input.delegate = self
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.addTarget(self, action:"set_name", forControlEvents: UIControlEventTouchDown)
    button.setTitle('Save', forState: UIControlStateNormal)
    button.frame = CGRectMake(265, 25, 50, 30)
    view.addSubview(button)
  end

  def set_name
   @@name = @name_input.text != '' ? @name_input.text : 'Lucky Player'
   @name_label.text = "Hi, #{@@name}"
   @name_input.resignFirstResponder
  end

  def show_name
    @name_label = UILabel.new
    @name_label.font = UIFont.systemFontOfSize(30)
    @name_label.text = "Hi, #{@@name}"
    @name_label.textAlignment = UITextAlignmentCenter
    @name_label.textColor = UIColor.whiteColor
    @name_label.backgroundColor = UIColor.clearColor
    @name_label.frame = [[@@margin, 60], [view.frame.size.width - @@margin * 2, 40]]
    view.addSubview(@name_label)
  end

  def show_score
    state = UILabel.new
    state.font = UIFont.systemFontOfSize(24)
    state.text = 'Your Current Score Is...'
    state.textAlignment = UITextAlignmentLeft
    state.textColor = UIColor.whiteColor
    state.backgroundColor = UIColor.clearColor
    state.frame = [[10, 120], [view.frame.size.width - @@margin * 2, 40]]
    view.addSubview(state)

    @score_label = UILabel.new
    @score_label.font = UIFont.systemFontOfSize(80)
    @score_label.text = @@score.to_s
    @score_label.textAlignment = UITextAlignmentCenter
    @score_label.textColor = UIColor.greenColor
    @score_label.backgroundColor = UIColor.clearColor
    @score_label.frame = [[@@margin, 165], [view.frame.size.width - @@margin * 2, 80]]
    view.addSubview(@score_label)
  end

  def show_buttons
    state = UILabel.new
    state.font = UIFont.systemFontOfSize(24)
    state.text = 'Adjust Your Score'
    state.textAlignment = UITextAlignmentCenter
    state.textColor = UIColor.whiteColor
    state.backgroundColor = UIColor.clearColor
    state.frame = [[@@margin, 260], [view.frame.size.width - @@margin * 2, 40]]
    view.addSubview(state)
  
    add_button("+1", 60, 300)
    add_button("+2", 140, 300)
    add_button("+3", 220, 300)
    add_button("+5", 60, 360)
    add_button("+10", 140, 360)
    add_button("+15", 220, 360)
    add_button("-5", 140, 420)
  end

  def add_button(name, x, y)
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.addTarget(self, action:"adjust_score:", forControlEvents: UIControlEventTouchDown)
    button.setTitle(name, forState: UIControlStateNormal)
    button.frame = CGRectMake(x, y, 40, 40)
    view.addSubview(button)
  end

  def adjust_score(sender)
    value = sender.titleForState(UIControlStateNormal)
    @@score += value.to_i    
    check_score
    @score_label.text = @@score.to_s
  end

  def check_score
    if @@score == 100
      alert = UIAlertView.new
      alert.title = "Game Over"
      alert.message = "Congratulations, you won!"
      alert.addButtonWithTitle("OK")
      alert.show
      @@score = 0
      @score_label.text = @@score.to_s
    elsif @@score > 100
      alert = UIAlertView.new
      alert.title = "Doh!"
      alert.message = "You went over 100 points and your score has wrapped..."
      alert.addButtonWithTitle("Argh!")
      alert.show
      @@score = @@score - 100
    end
  end

  def textFieldShouldReturn(text_field)
    set_name unless text_field != @name_input
  end

private
  def add_button(name, x, y)
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.addTarget(self, action:"adjust_score:", forControlEvents: UIControlEventTouchDown)
    button.setTitle(name, forState: UIControlStateNormal)
    button.frame = CGRectMake(x, y, 40, 40)
    view.addSubview(button)
  end

  def add_text_field(params)
    text_field = UITextField.new
    text_field.font = UIFont.systemFontOfSize(20)
    text_field.placeholder = params[:placeholder]
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
