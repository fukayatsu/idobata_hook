require 'spec_helper'

describe IdobataHook::Source do
  describe '#new' do
    subject(:source) { described_class.new(message) }

    context 'only strings' do
      let(:message) { ['aaa', 'bbb'] }
      it 'joins strings' do
        expect(subject.to_s).to eq('aaabbb')
      end
      it 'not force_html' do
        expect(subject.force_html?).to be false
      end
    end

    context 'with label' do
      let(:message) { ['aaa', {label: 'bar'}, 'baz'] }
      it 'joins strings and html' do
        expect(subject.to_s).to eq('aaa<span class="label">bar</span>baz')
      end
      it 'force_html' do
        expect(subject.force_html?).to be true
      end
    end
  end

  describe '.htmlize' do
    it 'just a string' do
      expect(described_class.htmlize('abc'))
        .to eq('abc')
    end
    it 'default label' do
      expect(described_class.htmlize({label: 'foo'}))
        .to eq('<span class="label">foo</span>')
    end
    it 'important label' do
      expect(described_class.htmlize({'label-important' => 'bar'}))
        .to eq('<span class="label label-important">bar</span>')
    end
    it 'default badge' do
      expect(described_class.htmlize({badge: '123'}))
        .to eq('<span class="badge">123</span>')
    end
    it 'important badge' do
      expect(described_class.htmlize({'badge-important' => '234'}))
        .to eq('<span class="badge badge-important">234</span>')
    end
    it 'emoji' do
      expect(described_class.htmlize({emoji: :smile}))
        .to eq('<img class="emoji" alt=":smile:" src="/images/emoji/smile.png">')
    end
    it 'font awesome' do
      expect(described_class.htmlize({fa: 'camera-retro'}))
        .to eq('<i class="fa fa-camera-retro"></i>')
    end
    it 'commit-id' do
      expect(described_class.htmlize({'commit-id' => '123abc'}))
        .to eq('<span class="commit-id">123abc</span>')
    end
  end
end