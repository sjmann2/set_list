require 'rails_helper'

describe 'Artists songs index' do
  before :each do
    @whitney_houston = Artist.create!(name: "Whitney Houston")
    @always_love = @whitney_houston.songs.create!(title: "I Will Always Love You", length: 458, play_count: 999)
    @wanna_dance = @whitney_houston.songs.create!(title: "I Wanna Dance With Somebody", length: 758, play_count: 1081)
  end
  it 'shows all of the titles of the songs for the artist' do
    visit "/artists/#{@whitney_houston.id}/songs"

    expect(page).to have_content(@always_love.title)
    expect(page).to have_content(@wanna_dance.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@whitney_houston.id}/songs"

    click_on @always_love.title

    expect(current_path).to eq("/songs/#{@always_love.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@whitney_houston.id}/songs"

    expect(page).to have_content("Average Song Length for Whitney Houston: 608")
  end
end