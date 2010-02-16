require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Doc" do
	
	before(:all) do
		@file_path =  File.dirname(__FILE__) + '/assets/metal_fans.jpg'
	end
	
	it "should have an attachment" do
		doc = Doc.new(:image=>File.open(@file_path,'r'))
		doc.image.should be_a_kind_of Grip::Attachment
	end
  
	describe "with image attachment" do
		
		before(:each) do
			@doc = Doc.new(:image=>File.open(@file_path,'r'))
		end
		
		it "should have a url" do
			@doc.image.url.should == "/images/grid/#{@doc.image.grid_key}"
		end
		
		it "should have a url for variant sizes" do
			@doc.image.url(:thumb).should == "/images/grid/#{@doc.image.grid_key}".gsub(@doc.image.file_name,"resize_50x50_#{@doc.image.file_name}")
		end
		
  end

	describe "with pdf attachment" do
		
		before(:each) do
			@file_path = File.dirname(__FILE__) + '/assets/sample.pdf'
			@doc = Doc.new(:pdf=>File.open(@file_path,'r'))
		end
		
		it "should have a url" do
			@doc.pdf.url.should == "#{@doc.pdf.grid_key}"
		end
		
	end

end
