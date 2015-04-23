class Picture < ActiveRecord::Base
  belongs_to :listing

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://longwhiteclouds.com/wp-content/themes/longwhiteclouds/images/missing-image-640x360.png"

  do_not_validate_attachment_file_type :image
end
