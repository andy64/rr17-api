module ControllerHelper
  extend ActiveSupport::Concern

  def format_error(errors)
    errors_hash = errors.to_hash
    "{errors:[#{errors_hash.each{|k,v| errors_hash[k] = v.join('; ')}}], status: 400}"
  end
end

