class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy

  has_attached_file :image, :styles => { :wide => "463x387>",
                                         :medium => "225x188>",
                                         :thumb => "240×240#",
                                         :big => "575x575#",},
                    :default_url => "http://longwhiteclouds.com/wp-content/themes/longwhiteclouds/images/missing-image-640x360.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
