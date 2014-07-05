require 'spec_helper'

describe IdobataHook::Client do
  subject(:client) { described_class.new('https://idobata.io/hook/generic/api-key-123abc') }

  describe '#send' do
    it 'send plain text' do
      expect(subject).to receive_message_chain(:http_client, :post).with(nil, source: "text message")
      response = client.send('text message')
    end

    it 'send html text' do
      expect(subject).to receive_message_chain(:http_client, :post).with(nil, source: "<h1>html</h1>", format: :html)
      response = client.send('<h1>html</h1>', format: :html)
    end

    it 'send text and image' do
      expect(subject).to receive(:image_io).with('~/sushi.png') { '[sushi io]' }
      expect(subject).to receive_message_chain(:http_client, :post).with(nil, source: "Look at this!", image: '[sushi io]')
      response = client.send('Look at this!', image_path: '~/sushi.png')
    end
  end
end