class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
    #  binding.pry
      if user_attribute != ""
        user = User.find_or_create_by(username: user_attribute)
        self.user = user
        self.save
      end
    end
  end
end
