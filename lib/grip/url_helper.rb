module Grip
	module UrlHelper
	
		def url(variant = nil)
			case 
			when self.file_name =~ /png|jpg|gif|jpeg/
				if variant && variants[variant.to_sym]
					width = variants[variant.to_sym][:width]
					height = variants[variant.to_sym][:height]
					"/images/grid/resize_#{width}_#{height}_#{grid_key}"
				else
					"/images/grid/#{grid_key}"
				end
			else
				grid_key
			end
		end
	
	end
end
Grip::Attachment.send(:include, Grip::UrlHelper)



  