require 'elasticsearch'
require 'json'
es = Elasticsearch::Client.new(hosts: "localhost:9200")

messages =  JSON.parse(`curl 'https://idobata.io/api/messages?room_id=696' -H "X-API-Token: 748528b4eaa7ad402c01affa027c8263"`)['messages']

#puts messages?
messages.each do |message|
  if message['sender_type'] == "User"
    es.index index: "idobata-tmix", type: "idodobata-messages", body: {
      id: message['id'],
      sender_name: message['sender_name'],
      body: message['body'],
      images_urls: message['images_urls'],
      created_at: message['created_at']
    }
  end
end
