class Post < ApplicationRecord

		belongs_to :user
		has_many :comments


		has_attached_file :image, styles: { biggest: "600x600>", regular: "300x300>"}
  		validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
		
end
