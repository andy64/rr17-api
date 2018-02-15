class CourseResult
  include Mongoid::Document
  field :usd, type: Decimal
  field :eur, type: Decimal
  field :rur, type: Decimal
 
  validates :rur, :eur, :usd, numericality: true, format: { with: /\A\d{1,8}(\.\d{0,4})?\z/}
  belongs_to :source_provider
end
