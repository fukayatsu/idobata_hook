require 'faraday'
require 'mime/types'
require 'idobata_hook/source'

module IdobataHook
  class Client
    def initialize(hook_url)
      @hook_url = hook_url
    end

    def send(messages, format: nil, image_path: nil)
      source = Source.new(messages)
      params = { source: source.to_s }
      params[:format] = :html if format.to_s == 'html' || source.force_html?
      params[:image]  = image_io(image_path) if image_path
      http_client.post(nil, params)
    end

  private

    def image_io(image_path)
      mime_type  = MIME::Types.type_for(image_path).first.simplified
      Faraday::UploadIO.new(image_path, mime_type)
    end

    def http_client
      @faraday ||= Faraday.new(url: @hook_url, headers: default_headers) do |conn|
        conn.request  :multipart
        conn.request  :url_encoded             # form-encode POST params
        conn.response :logger                  # log requests to STDOUT
        conn.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def default_headers
      { 'User-Agent' => "RubyGems::IdobataHook / #{IdobataHook::VERSION} " }
    end
  end
end