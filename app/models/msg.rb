class Msg < ActiveRecord::Base
  auto_html_for :content do
  	# see filter options at https://github.com/dejan/auto_html/blob/master/lib/auto_html/filters/soundcloud.rb
    # see demo: http://rors.org/demos/auto_html
    html_escape
    image
    vimeo	
    youtube(:width => 440, :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
  belongs_to :user
  belongs_to :channel
end
