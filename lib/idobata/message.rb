module Idobata
  class Message
    def self.create(params = {})
      Idobata.client.post(params)
    end
  end
end
