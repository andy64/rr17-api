require 'nokogiri'
require 'net/http'
require 'open-uri'

module ParserCurrency

  class BaseParser
    def initialize(page_source)
      @html_doc = Nokogiri::HTML(page_source)
    end
    protected
    def base_parse(path)
      h = {usd: @html_doc.xpath(path.('USD')).text.gsub(',','.'),
           eur: @html_doc.xpath(path.('EUR')).text.gsub(',','.'),
           rur: @html_doc.xpath(path.('RUB')).text.gsub(',','.')}
      raise 'Cannot find currency on page' if (h.values.include?("") || h.values.include?(nil) )
      {parsed: true, result: h}
    rescue => e
      Rails.logger.error e.message #check it's logging info
      {parsed: false, result: e.message}
    end
  end

  class ParitetParser < BaseParser
    def parse
      #BaseParser.instance_method(:parse).bind(self).call(path_build.('EUR'), path_build.('USD'), path_build.('RUR'))
      base_parse lambda{|x| "//*[@id='lcol']//span[contains(text(),'#{x}')]/../../td[2]"}
    end
  end

  class BsbParser < BaseParser
    def parse
      base_parse lambda{|x| "//span[text()='#{x}']/../../td[1]"}
    end
  end

  class NbParser < BaseParser
    def parse
      base_parse lambda{|x| "//*[@id='BodyHolder_tblRates']//td[contains(text(),'#{x}')]/../td[3]"}
    end

  end

end
