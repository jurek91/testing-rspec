class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]

  def index
    @albums = Album.all
    render json: @albums
  end

  def show
    render json: @album
  end

  private

  def set_album
    begin
      @album = Album.find(params[:id])
    rescue
      render json: { error: "Page not found"}, status: 404
    end
  end
end
