class ChangePhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :photo_file_name
    remove_column :photos, :photo_content_type
    remove_column :photos, :photo_file_size
    remove_column :photos, :photo_updated_at
    add_column :photos, :the_photo_file_name, :string
    add_column :photos, :the_photo_content_type, :string
    add_column :photos, :the_photo_file_size, :integer
    add_column :photos, :the_photo_updated_at, :datetime
  end
end
