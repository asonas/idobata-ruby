require "idobata/version"

module Idobata
  autoload(:Client, 'idobata/client')
  autoload(:Message, 'idobata/message')

  @hook_url = nil

  class << self
    def client
      @client ||= Client.new(@hook_url)
    end

    def hook_url=(new_value)
      @hook_url = new_value
      @client = nil
    end

    def hook_url
      @hook_url
    end
  end
end
