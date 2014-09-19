class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :the_photo, :styles => { :small => "100x100>", :original => "400x400>>" }
  validates_attachment_presence :the_photo
  validates_attachment_size :the_photo, :less_than => 5.megabytes
  validates_attachment_content_type :the_photo,
    :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

private
  def photo_params
    params.require(:photo).permit(:the_photo)
  end
end
