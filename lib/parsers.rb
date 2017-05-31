require 'nokogiri'
require 'net/http'
require 'open-uri'


module ParserCurrency



  class BaseParser
    def initialize(page_source)
      @html_doc = Nokogiri::HTML(page_source)
    end
    protected
    def base_parse(eur_path, usd_path, rur_path)
      eur = @html_doc.xpath(eur_path).text
      usd = @html_doc.xpath(usd_path).text
      rur = @html_doc.xpath(rur_path).text
      {parsed: true, result:{usd: usd, eur: eur, rur: rur}}
    rescue => e
      {parsed: false, result: e.message}
    end
  end

  class PriorParser < BaseParser
    def parse
      path_build = lambda{|x| "//*[@id='currencyAjax']//td[text()='#{x}']/following::td"}
      #BaseParser.instance_method(:parse).bind(self).call(path_build.('EUR'), path_build.('USD'), path_build.('RUR'))
      base_parse path_build.('EUR'), path_build.('USD'), path_build.('RUR')
    end
  end

  class MTBParser < BaseParser
    def parse
      path_build = lambda{|x| "/html/body/div[1]/div/div[1]/div[2]/div[1]/div[4]/div[1]/table[1]/tbody/tr[2]/td[#{x}]"}
      base_parse path_build.(2), path_build.(4), path_build.(5)
    end
  end

  class NBParser < BaseParser
    def parse
      path_build = lambda{|x| "//*[@id='BodyHolder_tblRates']/tbody/tr[#{x}]/td[3]"}
      base_parse path_build.(2), path_build.(3), path_build.(4)
    end

  end

end


#p ParserCurrency::ProirParser.new(open('https://priorbank.by/', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})).parse