module Idobata
  class Message
    def self.create(params = {})
      params = self.label_writer(params)
      Idobata.client.post(params)
    end

    def self.label_writer(params)
      labels =
        if params[:label].nil?
          []
        elsif params[:label].respond_to?(:to_ary)
          params[:label].to_ary || [params[:label]]
        else
          [params[:label]]
        end

      label_tags = labels.map do |label|
        type = label[:type] ? "label-#{label[:type]}" : ""
        "<span class='label #{type}'>#{label[:text]}</span>"
      end

      params[:source] = "#{label_tags.join(' ')} #{params[:source]}"
      params[:format] = :html unless labels.empty?

      params
    end
  end
end
