require 'faker/name'

class User < ApplicationRecord

  attr_reader :password

  has_secure_password
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_uniqueness_of :email
  validates :password, :presence => true,
            :confirmation => false,
            :length => {:within => 4..9},
            :on => :create
  validates :password, :confirmation => false,
            :length => {:within => 4..9},
            :allow_blank => true,
            :on => :update
  has_many :source_providers, -> {where active: true}
  before_destroy :deactivate_source_providers

  before_save do
    self.email.downcase
    validate_usernames
  end

  def full_name
    "#{first_name last_name}"
  end

  def valid_password?(param_pass)
    param_pass && self.authenticate(param_pass)
  rescue
    nil
  end


  protected
  def validate_usernames
    if (first_name||last_name).nil?
      self.first_name=Faker::Name.first_name
      self.last_name=Faker::Name.last_name
    elsif self.first_name&&self.last_name
      self.first_name.capitalize
      self.last_name.capitalize
    else
      throw(abort('Please specify both First and Last name'))
    end
  end

  def deactivate_source_providers
    self.source_providers.update_all(active: false, user_id: 0)
  end
end
