class Disclosure < ActiveRecord::Base

  has_many :disclosure_tags
  has_many :tags, through: :disclosure_tags


  def create_tags(params)
    



  end


end
