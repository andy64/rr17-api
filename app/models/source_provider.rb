class SourceProvider < ApplicationRecord
  validates_uniqueness_of :name, :url
  validates_presence_of :name, :url, :address
validate
end
