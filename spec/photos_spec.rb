require "spec_helper"

describe Photo do
    it { should belong_to :user }
    it { should have_attached_file(:the_photo) }
    it { should validate_attachment_presence(:the_photo) }
    it { should validate_attachment_size(:the_photo) }
    it { should validate_attachment_content_type(:the_photo).
         allowing('image/jpg', 'image/jpeg', 'image/png', 'image/gif') }
    it { should validate_attachment_size(:the_photo).less_than(5.megabytes) }
end
