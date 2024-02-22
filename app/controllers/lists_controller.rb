class ListsController < ApplicationController
  # GET "lists"
  # Un utilisateur peut voir toutes les listes
  def index
    @lists = List.all
  end

  # GET "lists/42"
  # Un utilisateur peut voir les détails d’une liste donnée et son nom
  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
