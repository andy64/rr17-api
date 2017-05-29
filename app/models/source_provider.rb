class SourceProvider < ApplicationRecord
  validates_uniqueness_of :name, :url
  validates_presence_of :name, :url, :address
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  has_many :course_results, dependent: :destroy
end
