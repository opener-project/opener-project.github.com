module Webservices

  class WebservicePageGenerator < Jekyll::Generator
    def generate(site)
      doc_pages = site.pages.select {|page| page.url.include?("webservices")}
      doc_pages.each do |doc_page|
        doc_page.data['clusters'] = webservices
      end
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

    def webservices
      config["webservices"]
    end
  end
end


