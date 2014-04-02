class SearchesController < ApplicationController
  def create
    @query = params[:search][:query]
    @results = Image.search(@query).includes(gallery: [:user])
    render :show
  end

end
