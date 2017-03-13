class User < ApplicationRecord
  # association
  has_many :estates
  has_many :tastings
  has_many :wines
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
