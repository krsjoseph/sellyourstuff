class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy

  has_attached_file :image, :styles => { :featured => "350x350#", :thumb => "100x100>" }, :default_url => "http://longwhiteclouds.com/wp-content/themes/longwhiteclouds/images/missing-image-640x360.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
