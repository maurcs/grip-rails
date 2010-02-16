require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "GridFile" do
	
	before do
		Dir[Rails.root + "/public/images/"].each do |file|
			file.destroy
		end
	end
	
	it "should create an image" do
		pending
	end
	
end