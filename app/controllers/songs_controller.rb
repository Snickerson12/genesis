class SongController < ApplicationController
    def index
        @songs = Song.all
    end
end