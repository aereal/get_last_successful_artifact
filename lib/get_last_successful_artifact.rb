require "uri"

require "jenkins_api_client"

class GetLastSuccessfulArtifact
  def initialize(jenkins_origin: nil, job_name: nil)
    @job_name = job_name.encode(Encoding::UTF_8)
    @client = JenkinsApi::Client.new(server_url: jenkins_origin)
  end

  def get
    last_successful_build  = self.get_last_successful_build
    relative_build_path   = last_successful_build['artifacts'][0]['relativePath']
    jenkins_path          = last_successful_build['url']
    URI.escape("#{jenkins_path}artifact/#{relative_build_path}")
  end

  def get_with_path(relative_path)
    response_json = self.get_last_successful_build
    if response_json['artifacts'].none? {|a| a['relativePath'] == relative_path }
      raise "Specified artifact not found in curent_build !!"
    end
    jenkins_path          = response_json['url']
    URI.escape("#{jenkins_path}artifact/#{relative_path}")
  end

  protected def get_last_successful_build
    @client.api_get_request("/job/#{URI.escape(@job_name)}/lastSuccessfulBuild")
  end
end
