require 'parsers'

class SourceProvider < ApplicationRecord
  include Canable::Ables
  include ParserCurrency

  validates_uniqueness_of :name, :url
  validates_presence_of :name, :url, :address
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  has_many :course_results, dependent: :destroy
  #scope :active, -> { where(active: true) }
  default_scope { where(active: true) }

  def destroyable_by?(user)
    user && self.author.id==user.id
  end

  def do_parse
    parser = sourse_parser
    parsed_response = self.class.const_get(parser.parser_name).new(open(parser.url)).parse
    pars = parsed_response[:result]
    CourseResult.create!(eur: pars[:eur].to_d, usd: pars[:usd].to_d, rur: pars[:rur].to_d, source_provider_id: self[:id])
    parsed_response
  end

  private
  def sourse_parser
    SourceParser.where(url: self.url).first
  end

end
