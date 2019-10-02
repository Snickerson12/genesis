class SongsController < ApplicationController
  before_action :require_logged_in

    def index
        @songs = Song.all
    end

    def show
      @song = Song.find(params[:id])
    end
end
