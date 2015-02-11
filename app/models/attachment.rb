class Attachment < ActiveRecord::Base
  belongs_to :article


 has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

 validates_attachment_content_type :photo, :content_type=>["image/jpeg","image/jpg","image/png", "image/gif"]
  
end
