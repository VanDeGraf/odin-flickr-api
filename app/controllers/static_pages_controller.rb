class StaticPagesController < ApplicationController
  require 'flickr'

  def photos
    @images = nil
    if params.key?(:id)
      @images = Flickr.new.people.getPhotos(user_id: params[:id]).to_a.map { |photo_info| Flickr.url_t(photo_info) }
    end
  end
end