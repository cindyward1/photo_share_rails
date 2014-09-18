class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true, :uniqueness => true,
            length: { maximum: 50 }

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
