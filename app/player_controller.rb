class PlayerController < UIViewController
  attr_accessor :window

  def loadView
    self.view = UIView.alloc.init
    self.view.backgroundColor = UIColor.whiteColor
  end

  def viewDidLoad
    margin = 10
    @name = create_text_field(placeholder: 'Enter player name', frame: [[margin, 20], [300, 30]])
    @score = 0
  end

  def viewWillAppear(animated)
    navigationItem.title = 'New Player'
    navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCancel, target:self, action:'cancel')
    navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
    navigationController.setNavigationBarHidden(false, animated:true)

    @name.text = nil
  end

  def cancel
    navigationController.popViewControllerAnimated(true)
  end

  def save
    return if !@name.text || @name.text.length < 1

    PlayersStore.shared.add_player do |player|
      player.creation_date = NSDate.date
      player.name = @name.text
      player.score = @score.to_i
    end
    navigationController.popViewControllerAnimated(true)
  end

private
  def create_text_field(params)
    text_field = UITextField.new
    text_field.font = UIFont.systemFontOfSize(20)
    text_field.placeholder = params[:placeholder]
    text_field.textAlignment = UITextAlignmentCenter
    text_field.textColor = UIColor.blackColor
    text_field.borderStyle = UITextBorderStyleRoundedRect
    text_field.keyboardType = params[:keyboardType] if params[:keyboardType]
    text_field.frame = params[:frame]
    view.addSubview(text_field)
    text_field
  end
end
