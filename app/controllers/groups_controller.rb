class GroupsController < ApplicationController
  before_action :authorize

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.add_member current_user
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = find_group
    @images = @group.images
  end

  private

  def group_params
    params.require(:group).
      permit(
        :name,
        :description
    )
  end

  def find_group
    Group.find(params[:id])
  end
end
