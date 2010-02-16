module Grip
	module UrlHelper
	
		def url(variant = nil)
			case 
			when self.file_name =~ /png|jpg|gif|jpeg/
				if variant && variants[variant.to_sym]
					width = variants[variant.to_sym][:width]
					height = variants[variant.to_sym][:height]
					"/images/grid/#{grid_key}".gsub(file_name,"resize_#{width}x#{height}_#{file_name}")
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



  