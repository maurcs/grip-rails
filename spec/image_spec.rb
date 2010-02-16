require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Grip::Rails::Image" do
	
	before do
		@file_path =  File.dirname(__FILE__) + '/assets/metal_fans.jpg'
		@doc = Doc.new(:image=>File.open(@file_path,'r'))
	end
	
	describe "with an image instance" do
		
		before :each do
			@img = Grip::Rails::Image.new(@doc.image.url(:thumb))
		end
	
		it "should resize an image" do
			@img.resize(10, 10)
			image = Magick::Image.read(Rails.root.to_s + "/public" + @doc.image.url(:thumb)).first
			image.columns.should be 10
			image.rows.should be 10
		end
		
	end
	
end
	