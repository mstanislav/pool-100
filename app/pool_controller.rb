class PoolController < UIViewController
  def loadView
    self.view = UIImageView.alloc.init
  end

  def viewDidLoad
    navigationItem.title = 'Pool to 100'
    navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle('Back', style: 0, target: self, action: 'cancel')
    view.image = UIImage.imageNamed('PoolTable.png')
    view.userInteractionEnabled = 'YES' 
    show_name
    show_score
    show_buttons
  end

  def show_player(player)
    @player = player
    @score = player.score
    @score_label.text = @score.to_s
    @name_label.text = player.name
  end

  def show_name
    @name_label = UILabel.new
    @name_label.font = UIFont.systemFontOfSize(30)
    @name_label.text = "Hi, #{$name}"
    @name_label.textAlignment = UITextAlignmentCenter
    @name_label.textColor = UIColor.whiteColor
    @name_label.backgroundColor = UIColor.clearColor
    @name_label.frame = [[10, 110], [300, 40]]
    view.addSubview(@name_label)
  end

  def show_score
    state = UILabel.new
    state.font = UIFont.systemFontOfSize(22)
    state.text = 'Your Current Score Is...'
    state.textColor = UIColor.whiteColor
    state.backgroundColor = UIColor.clearColor
    state.frame = [[45, 150], [300, 40]]
    view.addSubview(state)

    @score_label = UILabel.new
    @score_label.font = UIFont.systemFontOfSize(80)
    @score_label.text = @score.to_s
    @score_label.textAlignment = UITextAlignmentCenter
    @score_label.textColor = UIColor.whiteColor
    @score_label.backgroundColor = UIColor.clearColor
    @score_label.frame = [[10, 215], [300, 80]]
    view.addSubview(@score_label)
  end

  def show_buttons
    add_button('3', 18, 8)
    add_button('2', 280, 8)
    add_button('15', 7, 192)
    add_button('10', 287, 192)
    add_button('5', 18, 377)
    add_button('1', 280, 377)
    minus_button
  end

  def minus_button
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.addTarget(self, action: 'adjust_score:', forControlEvents: UIControlEventTouchDown)
    button.setTitle('-5', forState: UIControlStateNormal)
    button.frame = CGRectMake(120, 340, 80, 30)
    view.addSubview(button)
  end

  def adjust_score(sender)
    value = sender.titleForState(UIControlStateNormal)
    @score += value.to_i    
    check_score
    @score_label.text = @score.to_s
    save
  end

  def check_score
    if @score == 100
      show_alert('Game Over', 'Congratulations, you won!', 'OK')
      @score = 0
      @score_label.text = @score.to_s
    elsif @score > 100
      show_alert('Doh!', 'You went over 100 points and your score has wrapped...', 'Argh!')
      @score = @score - 100
    end
  end

  def save
    @player.score = @score
  end

  def cancel
    navigationController.popViewControllerAnimated(true)
  end

private
  def add_button(name, x, y)
    button = UIButton.buttonWithType UIButtonTypeCustom
    button.addTarget(self, action: 'adjust_score:', forControlEvents: UIControlEventTouchDown)
    button.setTitle(name, forState: UIControlStateNormal)
    button.backgroundColor = UIColor.clearColor
    button.frame = CGRectMake(x, y, 28, 28)
    view.addSubview(button)
  end

  def show_alert(title, message, button)
    alert = UIAlertView.new
    alert.title = title
    alert.message = message
    alert.addButtonWithTitle(button)
    alert.show
  end
end
