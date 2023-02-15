class PhotosController < ApplicationController
    def create
      Photo.create(photo_params) # attaches the uploaded file
    end
    
    def new
        @photo = Photo.new
    end

    private
end