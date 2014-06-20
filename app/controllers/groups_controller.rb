class GroupsController < ApplicationController
  def edit
    @store = Store.find(params[:store_id])
    @group = Group.find_by store_id: @store.id
  end

  def new
    @store = Store.find(params[:store_id])
    @group = @store.groups.build
  end

  def create

    @store = Store.find(params[:store_id])
    @group = @store.groups.new(group_params)

    if @group.save
      flash[:notice] = "A new group with id: [#{@group.id}] was successfully created."
      redirect_to @store
    else
      render :new
    end
  end

  def destroy
    @group.destroy
    redirect_to stores_path, notice: "Group with id: [#{@group.id}] has been successfully deleted."
  end

  def update
    @store = Store.find(params[:store_id])
    @group = @store.groups.find(params[:id])

    if @group.update(group_params)
      flash[:notice] = "Group with id: [#{@group.id}] was successfully updated."
      redirect_to @store
    else
      render :edit
    end
  end

  def show
    @store = Store.find(params[:store_id])
    @group = Group.find_by store_id: @store.id
  end

  private
    def group_params
      params.require(:group).permit!
    end
end
