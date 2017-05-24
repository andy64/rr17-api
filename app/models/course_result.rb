class CourseResult < ApplicationRecord
  validates :rur, :eur, :usd, numericality: true, format: { with: /\A\d{1,8}(\.\d{0,2})?\z/}
end
