class Shop < ApplicationRecord
  has_one_attached :shop_image
  belongs_to :user
  has_many :shop_comments, dependent: :destroy
  has_many :goods
  has_many :bads

  def get_shop_image(width, height)
    unless shop_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        shop_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    shop_image.variant(resize_to_limit: [width, height]).processed
  end

  def good_by?(user)
    goods.exists?(user_id: user.id)
  end

  def bad_by?(user)
    bads.exists?(user_id: user.id)
  end
  def self.looks(search, word)
    if search == "perfect_match"
      @shop = Shop.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @shop = Shop.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @Shop = Shop.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @shop = Shop.where("title LIKE?","%#{word}%")
    else
      @shop = Shop.all
    end
  end

end
