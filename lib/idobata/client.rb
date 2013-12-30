require 'faraday'

module Idobata
  class Client
    def initialize(api_base)
      default_header = {
        'User-Agent' => "Idobata / RubyBinding/#{Idobata::VERSION}"
      }
      @conn = Faraday.new(api_base, headers: default_header) do |builder|
        builder.request :url_encoded
        builder.adapter Faraday.default_adapter
      end
    end

    def post(args)
      begin
        @conn.post(nil, args)
      rescue Faraday::Error::ClientError => e
        raise e
      end
    end
  end
end
