class SearchesController < ApplicationController

  def show
    @query = params[:search][:query]
    @results = Image.search(@query).includes(gallery: [:user])
  end

end
