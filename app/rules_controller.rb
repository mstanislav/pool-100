class RulesController < UIViewController
  attr_accessor :window

  def viewDidLoad
    show_title
    show_rules
  end

  def show_title
    @title_label = UILabel.new
    @title_label.font = UIFont.boldSystemFontOfSize(20)
    @title_label.text = "The Rules for Playing '100'"
    @title_label.textAlignment = UITextAlignmentCenter
    @title_label.textColor = UIColor.whiteColor
    @title_label.backgroundColor = UIColor.clearColor
    @title_label.frame = [[10, 10], [300, 40]]
    view.addSubview(@title_label)
  end

  def show_rules
    @title_label = UILabel.new
    @title_label.font = UIFont.boldSystemFontOfSize(14)
    @title_label.text = "Each player (or team-player) gets a chance to pocket as many balls as possible. Each pocket is worth a specific value and for each pocketed-ball, the player receives that many points. If a player scratches or pockets a ball accidentally ('slop') they lose 5 points. If a player pockets a ball but also scratches or slops another ball, they get the value minus 5 points. \n\nTo win the game, you must score exactly 100 points. If you go over 100 points, your score wraps past 100 back to 0 (plus whatever you were 'over'). For example, if you had 95 points and scored a 15-point pocket, your new score is 10. 'Slop' does not apply when your score wraps, so you don't subtract any points in that case. As-needed, re-rack the balls and the current player gets to break."
    @title_label.textAlignment = UITextAlignmentLeft
    @title_label.textColor = UIColor.whiteColor
    @title_label.backgroundColor = UIColor.clearColor
    @title_label.lineBreakMode = UILineBreakModeWordWrap
    @title_label.numberOfLines = 0
    @title_label.frame = [[10, 20], [300, 400]]
    view.addSubview(@title_label)
  end
end
