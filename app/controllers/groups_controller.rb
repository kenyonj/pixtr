class GroupsController < ApplicationController
  before_action :authorize, except: [:show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.valid?
      group_membership = current_user.join @group
      process_activity group_membership
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = find_group
    @images = @group.images.
                includes(gallery: [:user])
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
