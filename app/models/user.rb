class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items dependent: :destroy
  # has_many :purchases dependent: :destroy
  
  FAMILY_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  FAMILY_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, # presence: true
            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,128}\z/,
                      message: 'includes both letters and numbers' }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :family_name, presence: true,
                          format: { with: FAMILY_NAME_REGEX,
                                    message: 'Full-width characters' }
  validates :first_name, presence: true,
                         format: { with: FAMILY_NAME_REGEX,
                                   message: 'Full-width characters'}
  validates :family_name_kana, presence: true,
                               format: { with: FAMILY_KANA_REGEX,
                                         message: 'Full-width katakana characters'}
  validates :first_name_kana, presence: true,
                              format: { with: FAMILY_KANA_REGEX,
                                        message: 'Full-width katakana characters'}
  validates :birth_date, presence: true
end
