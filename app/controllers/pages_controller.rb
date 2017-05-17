require 'open-uri'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:google6464ea87a0b2b52b, :home, :about, :history, :gallery, :exterior, :interiors, :medavy_by_night, :sky_views, :work, :send_contact_message, :legal]

  def home
    @hash_position = [{:lat=>48.6785688, :lng=>0.09740069999998013}]
    # formule pour ajouter un marquer personlisé
    # [{:lat=>17.4015693, :lng=>78.5199399, :picture=>{:url=>"/assets/custom_marker-a56fb984f2a4979b7f681ba7e0b59f1562cea1810f8089729323a1cfb7cb532e.png", :width=>32, :height=>32}}]
  end

  def legal
  end

  def history
  end

  def google6464ea87a0b2b52b
  end

  def gallery
    url = "http://res.cloudinary.com/dsosadxbk/image/list/medavy.json"
    my_json = JSON.parse(open(url).read)
    resources = my_json["resources"]
    @photo_ids = resources.map {|res| res["public_id"]}
    @photo_ids.reverse!
  end

end
