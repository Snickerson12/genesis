class PlaylistsController < ApplicationController
    before_action :find_playlist, only: [:show, :edit, :update, :destroy]

    def index
        @playlists = Playlist.all
    end

    def show
    end

    def new
        @playlist = Playlist.new
        @songs = Song.all
    end

    def create
        @playlist = Playlist.new(playlist_params)
        if @playlist.valid?
          @playlist.save
          redirect_to playlist_path(@playlist)
        else
          flash[:errors] = @playlist.errors.full_messages
          redirect_to new_playlist_path
        end
    end

    def edit
      @songs = Song.all
    end

    def update
      @playlist.assign_attributes(playlist_params)
      if @playlist.valid?
        @playlist.save
        @playlist.songs.clear
        params[:playlist][:song_ids].each do |i|
          song = Song.all.find_by(id: i)
          @playlist.songs << song
        end
        @playlist.save
        redirect_to playlist_path(@playlist)
      else
        flash[:errors] = @playlist.errors.full_messages
        redirect_to edit_playlist_path(@playlist)
      end

    end

    def destroy
      @playlist.songs.clear
      @playlist.destroy
      redirect_to playlists_path
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name, :creator_id, :song_ids => [])
    end

    def find_playlist
      @playlist = Playlist.find(params[:id])
    end


end
