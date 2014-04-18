module Documentation
  class Generator < Jekyll::Generator

    def generate(site)
      doc_page = site.pages.detect {|page| page.url == '/documentation/index.html'}
      doc_page.data['clusters'] = clusters
    end

    private

    def config
      @config ||= load_config_file
    end

    def load_config_file
      YAML.load_file(config_file_path)
    end

    def config_file_path
      File.expand_path("../../_components.yml", __FILE__)
    end

    def clusters
      config["clusters"]
    end

  end
end


