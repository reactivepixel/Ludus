class Msg < ActiveRecord::Base
  auto_html_for :content do
  	# see filter options at https://github.com/dejan/auto_html/tree/master/lib/auto_html/filters
    # see demo: http://rors.org/demos/auto_html
    # see jQuery option as well: https://github.com/dejan/jquery-auto_html
    html_escape
    image
    twitter
    vimeo	
    youtube(:width => 496, :height => 265, :autoplay => false)
    soundcloud
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
  belongs_to :user
  belongs_to :channel
end
