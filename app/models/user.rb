class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :shops, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :goods
  has_many :bads
  has_many :follow_g, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :follow_g, source: :followed

  has_many :follow_d, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :follow_d, source: :follower

  def follow(user_id)
    follow_g.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follow_g.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/def_icon.png')
      profile_image.attach(io: File.open(file_path), filename: 'def_icon.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
