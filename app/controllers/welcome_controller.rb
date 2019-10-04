class WelcomeController < ApplicationController

    def hello
      @playlist = Playlist.first
      @playlist_two = Playlist.second

    end
end
