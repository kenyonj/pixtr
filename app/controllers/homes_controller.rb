class HomesController < ApplicationController
  def show
    @galleries = Gallery.all
  end
end
