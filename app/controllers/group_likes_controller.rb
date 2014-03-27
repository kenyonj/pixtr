class GroupLikesController < LikesController

  private

  def find_target
    Group.find(params[:id])
  end
end
