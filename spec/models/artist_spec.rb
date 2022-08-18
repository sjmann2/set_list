require 'rails_helper'

describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @whitney_houston = Artist.create!(name: "Whitney Houston")
        @always_love = @whitney_houston.songs.create!(title: "I Will Always Love You", length: 458, play_count: 999)
        @wanna_dance = @whitney_houston.songs.create!(title: "I Wanna Dance With Somebody", length: 757, play_count: 1081)
        @have_nothing = @whitney_houston.songs.create!(title: "I Have Nothing", length: 1, play_count: 1081)

      end

      it 'returns the average song length' do
        expect(@whitney_houston.average_song_length.round(2)).to eq(405.33)
      end
    end
  end
end