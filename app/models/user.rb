require 'faker/name'

class User < ApplicationRecord
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_uniqueness_of :email

  before_save do
    self.email.downcase
    validate_usernames
  end

  def full_name
    "#{self.first_name self.last_name}"
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
end
