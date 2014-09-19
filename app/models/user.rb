class User < ActiveRecord::Base
  has_many :photos
  has_secure_password
  validates :email, :presence => true, :uniqueness => true,
            length: { maximum: 50 }
  validates_format_of :email, with: /^.+@.+\..+$/, on: :create, :multiline => true

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
