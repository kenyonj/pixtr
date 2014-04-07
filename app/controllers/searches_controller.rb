class SearchesController < ApplicationController

  def show
    @query = params[:search][:query]
    @results = find_results
  end

  private

  def find_results
    image_searcher = ImageSearcher.new(params[:search][:query])
    image_searcher.images.includes(gallery: [:user])
  end

end
