module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png?d=retro"
	end

	# not used in this version; gem auto_html provides a filter redcarpet that allows to use markdown
	def markdown(text)
		options = {
			hard_wrap: true,
			autolink: true, 
			quote: true, 
			fenced_code_blocks: true, 
			strikethrough: true, 
			underline: true, 
			highlight: true, 
			quote: true
		}
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
		return markdown.render(text).html_safe
	end

end

