require 'faraday'

module Idobata
  class Client
    def initialize(hook_url)
      default_header = {
        'User-Agent' => "Idobata / RubyBinding/#{Idobata::VERSION}"
      }
      @conn = Faraday.new(hook_url, headers: default_header) do |builder|
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
