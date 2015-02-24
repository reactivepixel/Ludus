class Upload < ActiveRecord::Base
  has_attached_file :avatar,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {...}


	def create
	  @upload = Upload.create( user_params )
	end


end