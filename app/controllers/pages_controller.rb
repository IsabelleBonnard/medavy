require 'open-uri'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :history, :gallery, :exterior, :interiors, :medavy_by_night, :sky_views, :work, :send_contact_message]

  def home
  end

  def history
  end

  def gallery
  end

  def exterior
    # all = Cloudinary::Api.resources
    # results = Cloudinary::Api.resources(type:"upload")
    # resources = results["resources"]
    # ids = resources.map {|res| res["public_id"]}
    # @ids = ids
    # ids.select! {|public_id| !public_id.include?("/")}
    url = "http://res.cloudinary.com/dsosadxbk/image/list/exterior.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @ids = resources.map {|res| res["public_id"]}
  end

  def interiors
    url = "http://res.cloudinary.com/dsosadxbk/image/list/castle.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @ids = resources.map {|res| res["public_id"]}
  end

  def medavy_by_night
    url = "http://res.cloudinary.com/dsosadxbk/image/list/night.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @ids = resources.map {|res| res["public_id"]}
  end

  def sky_views
    url = "http://res.cloudinary.com/dsosadxbk/image/list/skyviews.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @ids = resources.map {|res| res["public_id"]}

    url = "http://res.cloudinary.com/dsosadxbk/video/list/videodrone.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @idvideos = resources.map {|res| res["public_id"]}
  end

  def work
    url = "http://res.cloudinary.com/dsosadxbk/image/list/work.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @ids = resources.map {|res| res["public_id"]}
  end

end
