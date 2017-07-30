class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  #Virtual attribute
  attr_accessor :login

  validates_format_of :nickname, with: /^[a-zA-Z0-9\-_\.]*$/, :multiline => true

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:nickname) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

end
