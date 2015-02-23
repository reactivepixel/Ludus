class Msg < ActiveRecord::Base
  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
  belongs_to :user
  belongs_to :channel
end
