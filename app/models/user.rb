class User < ApplicationRecord
 # Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
   attr_accessor :email_confirmation, :login
   has_and_belongs_to_many :zones
   has_and_belongs_to_many :roles
   has_many :working_areas
   has_one :user_detail, dependent: :destroy
   has_many :retailors
   has_many :orders
   has_many :visits, dependent: :destroy
   scope :active, -> { where(is_active: true) }
   scope :not_deleted, -> { where(is_deleted: false) }
   has_one :user_detail, dependent: :destroy
   accepts_nested_attributes_for :user_detail
   def admin?
    Role.find_by(name: 'Admin')&.id
  end
  def self.search(query)
    if query.present?
      where("email LIKE ?", "%#{query}%")  # Assuming you want to search by name
    else
      all
    end
  end
  has_one :retailor_user, dependent: :destroy
  
  has_many :retailor_visits
  has_many :retailors, through: :retailor_visits 
  
end
