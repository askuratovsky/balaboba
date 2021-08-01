# frozen_string_literal: true

require_relative "balaboba/version"
require 'httparty'

module Balaboba
  extend self

  class Error < StandardError; end
  class BadQuery < StandardError; end
  THEMES = [
    :default,
    :сonspiracy_theories,
    :tv_reports,
    :toasts,
    :kid_quotes,
    :adv_slogans,
    :short_stories,
    :instagram_captions,
    :shorter_wiki,
    :movie_synopses,
    :horoscope,
    :folk_wisdom
  ]
  URL = 'https://zeapi.yandex.net/lab/api/yalm/text3'

  def request(phrase, theme: :default)
    raise Balaboba::Error, "invalid theme: #{theme}, use one of: #{Balaboba::THEMES}" unless THEMES.include?(theme)
    style = THEMES.find_index(theme)
    payload = {filter:1, intro: style, query: phrase}

    response = HTTParty.post(URL,
         :body => payload.to_json,
         :headers => {
           "Content-Type" => "application/json",
           "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36"
          },
         follow_redirects: true
       )
      if response.code.eql? 200
        if response['bad_query'].eql? 0
          response['text']
        else
          raise Balaboba::BadQuery, "bad query, response: #{response}"
        end
      else
        raise Balaboba::Error, "api response code: #{response.code}"
      end
  end
end
