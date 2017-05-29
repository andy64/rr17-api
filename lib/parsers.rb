require 'nokogiri'
require 'net/http'
require 'open-uri'

module ParserCurrency
  def self.parse_prior(page_source)
    str = lambda{|x| "//*[@id='currencyAjax']//td[text()='#{x}']/following::td"}
    basic_parse(page_source, str.('EUR'), str.('USD'), str.('RUR'))
  end
  def self.parse_mtbank(page_source)
    str = lambda{|x| "/html/body/div[1]/div/div[1]/div[2]/div[1]/div[4]/div[1]/table[1]/tbody/tr[2]/td[#{x}]"}
    basic_parse(page_source, str.(2), str.(4), str.(5))
  end

  def self.parse_nbrb(page_source)
    str = lambda{|x| "//*[@id='BodyHolder_tblRates']/tbody/tr[#{x}]/td[3]"}
    basic_parse(page_source, str.(2), str.(3), str.(4))
  end

  private
  def self.basic_parse(page_source, eur, usd, rur )
    html_doc = Nokogiri.HTML(page_source)
    eur = html_doc.xpath(eur).text
    usd = html_doc.xpath(usd).text
    rur = html_doc.xpath(rur).text
    {parsed: true, result:{usd: usd, eur: eur, rur: rur}}
  rescue => e
      {parsed: false, result: e.message}

  end

end

#p ParserCurrency.parse(open('https://priorbank.by/', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))