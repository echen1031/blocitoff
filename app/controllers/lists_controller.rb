class ListsController < ApplicationController
  def index
    @lists = List.all
    authorize @lists
  end

  def new
    @list = List.new
    authorize @list
  end

  def show
    @list = List.find(params[:id])
    @list_item = ListItem.find(params[:id])
  end

  def edit
    @list = List.find params[:id]
    authorize @list 
  end

  def create
    @list = current_user.lists.build(list_params)
    authorize @list
    if @list.save
      redirect_to @list, notice: 'Your new To-do list was saved'
    else
      flash[:notice] =  'Error creating To-do list'
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    authorize @list
    if @list.update_attributes(list_params)
      redirect_to @list
    else
      flash[:notice] = 'Error updating To-do list. Please try again'
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    name = @list.description
    if @list.destroy
      flash[:notice] = "#{name} was deleted successfully"
      redirect_to lists_path
    else 
      flash[:notice] = 'Error deleting To-do List. Please try again'
      render :show
    end
  end

  private
 
  def list_params
    params.require(:list).permit(:description, list_items_attributes: [:content, :list_id, :_destroy])
  end
end
