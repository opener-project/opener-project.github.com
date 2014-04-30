module Jekyll
  module HandleFilter

    def handle(input)
      input.gsub(/\W/,'-').gsub(/-+/,'-').downcase
    end

    def handleize(input)
      handle(input)
    end

    def identify(input)
      handle(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::HandleFilter)
