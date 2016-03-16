class PetitionsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @petitions = Petition.all
    if params[:my]
      @petitions = @petitions.where(user: current_user)
      render 'my_index'
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  end