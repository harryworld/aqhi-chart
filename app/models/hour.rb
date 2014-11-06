class Hour < ActiveRecord::Base
  belongs_to :district

  def timeTitle
    self.title.to_time.strftime("%H:%M")
  end
end
