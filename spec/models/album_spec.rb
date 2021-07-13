require 'rails_helper'

RSpec.describe Album, type: :model do

  it "has a valid factory" do
    album = build(:album)
    expect(album).to be_valid
  end

  describe "validations" do
    # before(:each) do
    #   @album = build(:album)
    # end

  it "is invalid without a title" do
    album = build(:album, title: nil)
    expect(album).to_not be_valid
  end

  it "is invalid without a release date" do
    album = build(:album, date_released: nil)
    expect(album).to_not be_valid
  end

  it "is invalid without an issue_number" do
    album = build(:album, issue_number: nil)
    expect(album).to_not be_valid
  end

  it "is invalid without a negative issue number" do
    album = build(:album, issue_number: -1)
    expect(album).to_not be_valid
  end

  it "is invalid with an artist shorter than 2 characters" do
    album = build(:album, artist: "a")
    expect(album).to_not be_valid
  end
end

  describe ".age" do
    it "should return an Integer" do
      album = build(:album)
      expect(album.age).to be_a Integer
    end

    it "should return the correct age" do
      album = build(:album, date_released: 5.years.ago)
      expect(album.age).to eq 5
    end
  end
end
