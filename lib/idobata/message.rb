module Idobata
  class Message
    def self.create(params = {})
      params = self.label_writer(params)
      Idobata.client.post(params)
    end

    def self.label_writer(params)
      label = params[:label]
      if label
        type = label[:type] ? "label-#{label[:type]}" : ""
        params[:source] = "<span class='label #{type}'>#{label[:text]}</span> #{params[:source]}"
        params[:format] = :html unless params[:format] == :html
      end
      params
    end
  end
end
