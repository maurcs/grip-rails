grip-rails Helps Use `Grip` inside Rails
===

[Grip](http://github.com/twoism/grip) is a MongoMapper GridFS Attachment gem, and is a dependency for grip-rails.

GridFile: A Rails Metal Image Server
---

`GridFile` adds a route for `/images/grid/[file_name]` this route will fetch images attached to a `MongoMapper::Document` with `Grip`.


Alternately, this route checks for `/images/grid/resize_[width]x[height]_[file_name]` and will serve up, and cache, an image at the requested file dimensions.

URL Helpers for Grip::Attachment
---

To help with these dynamic url, there is a `#url` method placed on Grip::Attachment. [(See grip documentation)](http://github.com/twoism/grip). 

Set up a `grid_attachment`:

  class Doc
    include MongoMapper::Document
    include Grip::HasAttachment
    has_grid_attachment :image, :variants => {:thumb => {:width=>50,:height=>50}}
  end

Then you can call `#url`:

  puts @doc.image.url 
  => /images/grip/doc/12345678910/image/file_name.jpg

And when a variant is passed in:

  puts @doc.image.url(:thumb) 
  => /images/grip/doc/12345678910/image/resize_50X50_file_name.jpg
