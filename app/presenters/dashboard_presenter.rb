class DashboardPresenter
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def courses
    # TODO: associate users with courses and groups, then we'll add some other stuff
    # show all the available courses for now
    Course.all
  end
end
