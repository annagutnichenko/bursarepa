class Petitions < ActiveRecord::Base


  belongs_to :user

  validates :title,  :presence => true,
            :uniqueness => true,
            :length => {:minimum => 1}

  validates :text, :presence => true,
            :length => {:minimum => 1},
            :uniqueness => true
end
