require "rest-client"

module Qiitakun
  class Qiita
    API_ENDPOINT = "https://qiita.com/api/v2"

    def initialize(qiita_token)
      @qiita_token = qiita_token
    end

    def items
      json = RestClient.get("#{API_ENDPOINT}/items", "Authorization" => "Bearer #{@qiita_token}", accept: :json).body
      JSON.parse(json, symbolize_names: true).map { |repository| repository[:title] }
    end
  end
end
