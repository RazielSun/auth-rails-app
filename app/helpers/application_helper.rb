module ApplicationHelper

	def full_title(page_title='')
		base_title = 'Auth Web Application'
		if page_title.empty?
			base_title
		else
			page_title + ' | ' + base_title
		end
	end

	def body_class(class_name="default_class")
    	content_for :body_class, class_name
  	end
	
end
