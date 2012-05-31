class PoolController < UIViewController
  @@margin = 20
  @@score = 0

  def viewDidLoad
    show_name('Mark')
    show_score
    show_buttons
  end

  def show_name(name)
    state = UILabel.new
    state.font = UIFont.systemFontOfSize(30)
    state.text = "Good Luck, #{name}"
    state.textAlignment = UITextAlignmentCenter
    state.textColor = UIColor.whiteColor
    state.backgroundColor = UIColor.clearColor
    state.frame = [[@@margin, 25], [view.frame.size.width - @@margin * 2, 40]]
    view.addSubview(state)
  end

  def show_score
    state = UILabel.new
    state.font = UIFont.systemFontOfSize(24)
    state.text = 'Your Score is...'
    state.textAlignment = UITextAlignmentLeft
    state.textColor = UIColor.whiteColor
    state.backgroundColor = UIColor.clearColor
    state.frame = [[10, 80], [view.frame.size.width - @@margin * 2, 40]]
    view.addSubview(state)

    @score_label = UILabel.new
    @score_label.font = UIFont.systemFontOfSize(80)
    @score_label.text = @@score.to_s
    @score_label.textAlignment = UITextAlignmentCenter
    @score_label.textColor = UIColor.greenColor
    @score_label.backgroundColor = UIColor.clearColor
    @score_label.frame = [[@@margin, 125], [view.frame.size.width - @@margin * 2, 80]]
    view.addSubview(@score_label)
  end

  def show_buttons
    state = UILabel.new
    state.font = UIFont.systemFontOfSize(24)
    state.text = 'Adjust Your Score'
    state.textAlignment = UITextAlignmentCenter
    state.textColor = UIColor.whiteColor
    state.backgroundColor = UIColor.clearColor
    state.frame = [[@@margin, 220], [view.frame.size.width - @@margin * 2, 40]]
    view.addSubview(state)
  
    add_button("+1", "plus_1", 60, 270)
    add_button("+2", "plus_2", 140, 270)
    add_button("+3", "plus_3", 220, 270)
    add_button("+5", "plus_5", 60, 320)
    add_button("+10", "plus_10", 140, 320)
    add_button("+15", "plus_15", 220, 320)
    add_button("-5", "minus_5", 140, 390)
  end

  def add_button(name, action, x, y)
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.addTarget(self,  action:"#{action}", forControlEvents: UIControlEventTouchDown)
    button.setTitle(name, forState: UIControlStateNormal)
    button.frame = CGRectMake(x, y, 40, 40)
    view.addSubview(button)
  end

  def plus_1
    @@score += 1 
    @score_label.text = @@score.to_s
  end
end
