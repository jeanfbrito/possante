class Document < ActiveRecord::Base
  belongs_to :maintenance
  mount_uploader :file, FileUploader
end
