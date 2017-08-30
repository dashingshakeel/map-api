class WelcomeController < ApplicationController
   require "net/http"
   require "uri"
   require 'open-uri'

  def index
    @uri1 = URI.parse("http://ip-api.com/json").read

    a=JSON.parse(@uri1)
    @lat = a["lat"]

    @lon = a["lon"]
    @uri = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@lat},#{@lon}&key=AIzaSyCnRK9xxC6VN9HjugwH0IYP6MkNWKsAxEI").read

  end
  def search
    search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{params[:query]}&key=AIzaSyCnRK9xxC6VN9HjugwH0IYP6MkNWKsAxEI"
    details_url = "https://maps.googleapis.com/api/place/details/json"
    @uri = URI.parse(search_url).read
    @json = JSON.parse(@uri)
    @place_id = @json["results"][0]["place_id"] 
    render :json => @json
    url ="https://www.google.com"
  end
end
