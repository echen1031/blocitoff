class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find params[:id]
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'Your new To-do list was saved'
    else
      flash[:notice] =  'Error creating a To-do list'
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private

  def list_params
    params.require(:list).permit(:description, :user)
  end
end
