require 'highline/import'
require 'octokit'
require 'yaml'
require 'base64'

class Updater
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:login=>ask_username,
                                  :password=>ask_password)

  end

  def update
    documentation["components"].flat_map{|c| c["components"]}.each do |component|
      owner, repo = component["repository"].split("/")[-2..-1]
      repo = [owner,repo].join("/")
      contents = yaml_front_matter(component, repo)

      files.each do |filename|
        begin
          response = client.contents(repo, :path=>filename)

          contents << "\n\n"
          contents << "<div id='#{filename.split(".")[0].downcase}'></div>"
          contents << "\n\n"
          contents << Base64.decode64(response[:content])

          path = File.expand_path("../../source/documentation/#{identify(component['name'])}.md", __FILE__)
          file = File.open(path, "wb")
          file.write(contents)
          file.close
          puts "Updated #{repo}/#{filename}"
        rescue Octokit::NotFound
        end
      end
    end
  end

  def config
    @config ||= YAML.load_file(config_file_path)
  end

  def documentation
    config["documentation"]
  end

  private

  def yaml_front_matter(component, repo="opener-project/")
    options = {"layout"=>"default",
               "title"=>component["name"],
               "sidebar"=>"documentation",
               "webservice"=>component["webservice"],
               "repository"=>"https://github.com/#{repo}"}
    yaml = YAML.dump(options)
    yaml << "\n---\n\n"
  end

  def files
    downcased = ["readme", "reference"]
    downcased.zip(downcased.map(&:upcase)).flatten.map{|name| "#{name}.md"}
  end

  def config_file_path
    File.expand_path("../../source/_components.yml", __FILE__)
  end

  def repositories
  end

  def ask_username
    ask("Github username: ")
  end

  def ask_password
    ask("Github password: "){ |q| q.echo = "x" }
  end

  def identify(string)
    string.gsub(/\W/,"-").gsub(/-+/,"-").downcase
  end

end

