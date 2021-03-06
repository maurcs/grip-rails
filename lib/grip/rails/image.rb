require 'rmagick'

module Grip
	module Rails
		class Image
  
		  BASE_URI      = "http://localhost:3000"
		  RESIZE_REGEXP = /resize_(\d*)x(\d*)_/
		  BASE_FS_PATH  = "#{RAILS_ROOT}/public"

		  def initialize path
		    @incoming_path = path[1..-1]
		    class << @incoming_path
		      def parts
		        self.split("/")
		      end
		      def dir_path
		        self.parts[0..-2].join("/")
		      end
		      def file_name
		        self.parts[-1..-1].flatten
		      end
		      def grid_fs_path
		        self.gsub(RESIZE_REGEXP,"").gsub("images/grid/","")
		      end
		    end
		  end
  
		  def dest_file_path
		    [BASE_FS_PATH,@incoming_path].join("/")
		  end
  
		  def full_dir_path
		    [BASE_FS_PATH, @incoming_path.dir_path].join("/")
		  end
  
		  def grid_store_path
		    @incoming_path.gsub(RESIZE_REGEXP,"").gsub("images/grid/","")
		  end
  
		  def redirect_path
		    "#{BASE_URI}/images/grid/#{grid_store_path}"
		  end
  
		  def resize width,height
				images = Magick::Image.from_blob(file_data.read)
				new_image = images.first.adaptive_resize(width.to_i, height.to_i)
				FileUtils.mkdir_p full_dir_path
				new_image.write(dest_file_path)
		  end
  
		  def exists?
		    GridFS::GridStore.exist?(MongoMapper.database,@incoming_path.grid_fs_path)
		  end
  
		  def file_data
		    GridFS::GridStore.open(MongoMapper.database, @incoming_path.grid_fs_path, 'r') {|file| file}
		  end
  
		end
	end
end