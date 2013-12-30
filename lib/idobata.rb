require "idobata/version"

module Idobata
  autoload(:Client, 'idobata/client')
  autoload(:Message, 'idobata/message')

  @api_base = nil

  class << self
    def client
      @client ||= Client.new(@api_base)
    end

    def api_base=(new_value)
      @api_base = new_value
      @client = nil
    end

    def api_base
      @api_base
    end
  end
end
