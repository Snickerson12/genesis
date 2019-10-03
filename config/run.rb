require 'RSpotify'

def client_id
    client_id = File.read("./id.env")
end

def client_secret
    client_secret = File.read("./secret.env")
end

RSpotify::authenticate(client_id, client_secret)

search = RSpotify::Artist.search('Grateful Dead')
p search.first.name
songs = search.first.top_tracks(:US).map {|song| song.name}
p songs

# <% if results %>
# <% results.map do |result| %>
#   <p><%= result.name %> - <%= result.artists.first.name %> [<%= result.album.name %>] </p>
# <% end %>
# <% end %>



#  <% preview = "https://open.spotify.com/embed/track/"+ result.uri.split(/:/)[2] %>
# <iframe src=<%=preview%> width="300" height="80" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>

