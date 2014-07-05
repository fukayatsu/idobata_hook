module IdobataHook
  class Source
    def initialize(*messages)
      @text, @force_html = parse(messages.flatten)
    end

    def force_html?
      @force_html
    end

    def to_s
      @text
    end

    def parse(messages)
      force_html = false
      text = messages.map do |message|
        next message if message.is_a? String
        force_html ||= true
        Source.htmlize(message)
      end.join
      [text, force_html]
    end

    class << self
      def htmlize(message)
        return message if message.is_a? String

        type, text = message.first
        case type.to_s
        when 'label'
          %(<span class="label">#{text}</span>)
        when /label-(.+)/
          %(<span class="label label-#{$1}">#{text}</span>)
        when 'badge'
          %(<span class="badge">#{text}</span>)
        when /badge-(.+)/
          %(<span class="badge badge-#{$1}">#{text}</span>)
        when 'emoji'
          %(<img class="emoji" alt=":#{text}:" src="/images/emoji/#{text}.png">)
        when 'fa'
          %(<i class="fa fa-#{text}"></i>)
        when 'commit-id'
          %(<span class="commit-id">#{text}</span>)
        else
          raise "unsupported type: #{type}"
        end
      end
    end
  end
end