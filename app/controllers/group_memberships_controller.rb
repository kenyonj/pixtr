class GroupMembershipsController < ApplicationController
  def create
    @group = find_group
    membership = current_user.join @group
    process_activity membership
  end

  def destroy
    @group = find_group
    current_user.leave @group
  end

  private

  def find_group
    Group.find(params[:id])
  end
end
