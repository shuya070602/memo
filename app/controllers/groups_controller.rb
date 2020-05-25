class GroupsController < ApplicationController
  def index
    target_group_user = GroupUser.select([:group_id]).where(user_id: current_user.id)
    @groups = Group.where(id: target_group_user)
  end

  def new
  	@group = Group.new
  	@group.users << current_user
  end

  def create
  	@group = Group.new(group_params)
    @group.group_users.build(user_id: current_user.id)
  	if @group.save
  		redirect_to groups_path
  	else
  	 render 'new'
  	end
  end

  def edit
  	@group = Group.find(params[:id])
    exist_users = User.eager_load(:groups).where(groups: { id: @group.id })
    @users = User.where.not(id: exist_users.map{|u| u.id})
  end

  def update
    @group = Group.find(params[:id])
    if params[:group][:user][:name] != ""
     user = User.find(params[:group][:user][:name])
     users = @group.users
     users << user
     @group.update_attribute(:users, users)
     @group.save
    end
  	if @group.update(group_params)
  	 redirect_to groups_path
  	else
  	 render 'edit'
  	end
  end

  def destroy
  	@group = Group.find(params[:id])
  	@group.destroy
  	redirect_to groups_path
  end

  private

  def group_params
  	params.require(:group).permit(:name, :user_id)
  end


end
