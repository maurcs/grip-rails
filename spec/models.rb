class Doc
  include MongoMapper::Document
  include Grip::HasAttachment
  has_grid_attachment :image, :variants => {:thumb => {:width=>50,:height=>50}}
  has_grid_attachment :pdf
end