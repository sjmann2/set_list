require 'rails_helper'

describe 'the songs show page' do
  it 'displays the song title ' do
    artist = Artist.create(name: "The Chicks")
    song = artist.songs.create!(title: "Goodbye Earl", length: 456, play_count: 560)
    song_2 = artist.songs.create!(title: "Cowboy Take Me Away", length: 297, play_count: 255)

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create(name: "The Chicks")
    song = artist.songs.create!(title: "Goodbye Earl", length: 456, play_count: 560)
    song_2 = artist.songs.create!(title: "Cowboy Take Me Away", length: 297, play_count: 255)

    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end
end