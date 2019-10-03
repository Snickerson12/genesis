require 'rspotify'
require 'pry'

def client_id
    client_id = File.read("./id.env")
end

def client_secret
    client_secret = File.read("./secret.env")
end

RSpotify::authenticate(client_id, client_secret)
# @spotify_user = RSpotify::User.new
# @spotify_user = RSpotify::User.find('12133914006')
@spotify_user = RSpotify::User.new({'credentials' => ({
  'id' => '12133914006',
  'credentials' => {
    'token' => 'BQAsJhXX8UZl0LsiuhLZbs533x_nzJSesnI1m1AZDjevt78lu6ofkmqAT5oH-EK-jSPd0lF1Le1D9_ckokReq-J4pPeGJDSmwdVV-siCK6W2sPh7mCHmtB0g5hT5A17R1nRqR8hCvjnnC8AyGCQDt86JVIJ7R9Lw6GoceeDxX47fz0Fjq-4V5Vs1ULxU',
    'refresh_token' => 'AQCcRXOfcrzYsrQv2If51NlH_VhAw2kGomsMSBdwHsJPCwyZT23I0mSY79M5LzqUpJf-JlDKPn8fg-tMBn9vuBQmp_-tNk_-TMuli4xbjThF0hv3VsosDz6HxKtDz2Fb64Cp_Q'
  }
})})

p @spotify_user

#@spotify_user.create_playlist!('New Playlist')


class PlaylistsController < ApplicationController
    before_action :require_logged_in
    before_action :find_playlist, only: [:show, :edit, :update, :destroy, :share, :share_playlist, :like]

    def index
        @playlists = Playlist.all
    end

    def show
      # if the playlist is public, the playlist.creator_id is session[:user_id], or the userplaylist includes session[:user_id]
      @listener = User.find_by(id: session[:user_id])
      if @playlist.private == false || @playlist.creator_id == session[:user_id] || @playlist.listeners.include?(@listener)
        playlist_path(@playlist)
      else
        redirect_to playlists_path
      end
    end

    def new
        @playlist = Playlist.new
        @songs = Song.all
    end

    def create

        @playlist = Playlist.new(playlist_params)
        @playlist.creator_id = session[:user_id]
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

    def share
      @users = User.all
    end

    def share_playlist
      @playlist.listeners.clear
      params[:playlist][:listener_ids].each do |id|
        user = User.find_by(id: id)
        @playlist.listeners << user
      end
      redirect_to playlist_path(@playlist)
    end

    def like
      @playlist.likes += 1
      @playlist.save
      redirect_to playlist_path(@playlist)
    end


    private

    def playlist_params
        params.require(:playlist).permit(:name, :private, :creator_id, :songs => [:song_ids => []])
    end

    def find_playlist
      @playlist = Playlist.find(params[:id])
    end


end
