class ListsController < ApplicationController
  def index
  end

  def show
    @list = List.find params[:id]
  end

  def new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'Your new TODO list was saved'
    else
      redirect_to @list, notice: 'Error: you should have content in description'
    end
  end

  def edit
  end

  def destroy
  end

  private

  def list_params
    params.require(:list).permit(:description)
  end
end
