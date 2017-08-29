class WelcomeController < ApplicationController
   require "net/http"
   require "uri"

  def index
    uri = URI.parse("http://ip-api.com/json/#{request.remote_ip}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    @response = http.request(request)
    
  end
end
