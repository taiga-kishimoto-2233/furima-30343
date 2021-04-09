class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  Japanese_regex = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  Katakana_regex = /\A(?:\p{Katakana})+\z/

  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :nickname, :password_confirmation, :last_name, :first_name, :last_name_f, :first_name_f, :birthday, presence: true

  validates :last_name, :first_name, format: { with: Japanese_regex }
  validates :last_name_f, :first_name_f, format: { with: Katakana_regex }

  has_many :items
end
