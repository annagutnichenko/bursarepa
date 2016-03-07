class PetitionsController < ApplicationController
  def new
  end

  def create

  end


  @petitions = Petitions.all

  #
  # def show
  #   @petitions = Petition.find(params[:id])
  # end
  #
  # def edit
  #   @petitions = Petition.find(params[:id])
  # end
  #
  # def update
  #   @apetitions = Petition.find(params[:id])
  #   if @petitions.update_attributes(params[:petition])
  #     redirect_to @petition, notice: "Petition has been updated."
  #   else
  #     render "edit"
  #   end
  # end
end
