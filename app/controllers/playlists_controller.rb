class PlaylistsController < ApplicationController
    before_action :find_playlist, only: [:show, :edit, :update, :destroy]

    def index
        @playlists = Playlist.all
    end

    def show
    end

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(playlist_params)
        @playlist.save
        # @playlist.save
        # p params[:playlist][:song_ids]
        # params[:playlist][:song_ids].each do |i|
        #     if i != nil || i != ""
        #         song = Song.all.find_by(id: i)
        #         @playlist.songs << song
        #     end
        # end
        # @playlist.save
        redirect_to playlist_path(@playlist)
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def playlist_params
        params.require(:playlist).permit([:name, :creator_id])
    end

    def find_playlist
    end


end
