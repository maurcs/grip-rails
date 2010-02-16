# Allow the metal piece to run in isolation
require(Rails.root + "/config/environment") unless defined?(Rails)
require(Rails.root + "/config/initializers/database") unless defined?(Rails)

class GridFile
  
  def self.test_for_resize path
    path.match(Grip::Rails::Image::RESIZE_REGEXP)
  end
  
  def self.call(env)
    include Mongo
    include GridFS
    request = Rack::Request.new(env)
    if request.path_info =~ /^\/images\/grid\/(.+)$/
			Rails.logger.info "\n====\n#{$1}"
      matches = GridFile.test_for_resize request.path_info
      unless matches      
        if GridFS::GridStore.exist?(MongoMapper.database,$1)
          GridFS::GridStore.open(MongoMapper.database, $1, 'r') do |file|
            [200, {"Content-Type" => file.content_type}, [file.read]]
          end
        else
          [404, {"Content-Type" => "text/html"}, ["Not Found"]]
        end
      else        
        width,height  = matches.captures
        img           = Grip::Rails::Image.new(request.path_info)
        if img.exists?
          resized_image = img.resize(width,height)
          [200, {"Content-Type" => MIME::Types.type_for(resized_image.path).to_s}, [resized_image.read]]
        else
          [404, {"Content-Type" => "text/html"}, ["#{grid_file_path} Not Found"]]
        end
      end
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
