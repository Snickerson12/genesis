class UsersController < ApplicationController
  before_action :require_logged_in, only: [:index, :show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @playlists = Playlist.all
    @userplaylists = UserPlaylist.all
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    # raise @user.inspect
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'hello'
  end

  def spotify
  spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  # Now you can access user's private data, create playlists and much more

  # Access private data
  spotify_user.country #=> "US"
  spotify_user.email   #=> "example@email.com"

  # Create playlist in user's Spotify account
  playlist = spotify_user.create_playlist!('my-awesome-playlist')

  # Add tracks to a playlist in user's Spotify account
  tracks = RSpotify::Track.search('Know')
  playlist.add_tracks!(tracks)
  playlist.tracks.first.name #=> "Somebody That I Used To Know"

  # Access and modify user's music library
  spotify_user.save_tracks!(tracks)
  spotify_user.saved_tracks.size #=> 20
  spotify_user.remove_tracks!(tracks)

  albums = RSpotify::Album.search('launeddas')
  spotify_user.save_albums!(albums)
  spotify_user.saved_albums.size #=> 10
  spotify_user.remove_albums!(albums)

  # Use Spotify Follow features
  spotify_user.follow(playlist)
  spotify_user.follows?(artists)
  spotify_user.unfollow(users)

  # Get user's top played artists and tracks
  spotify_user.top_artists #=> (Artist array)
  spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)

  # Check doc for more
end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
