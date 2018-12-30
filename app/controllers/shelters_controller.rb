class SheltersController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  def index
    @shelters = Shelter.all.order(:name)
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)

    if @shelter.save
      flash[:notice] = "Shelter was saved successfully."
      redirect_to shelter_path(@shelter)
    else
      flash[:notice] = @shelter.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    if @shelter.update_attributes(shelter_params)
      flash[:notice] = "Shelter successfully updated."
      redirect_to shelter_path
    else
      flash[:notice] = "Error. Shelter not updated."
      render :edit
    end
  end

  protected

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "You do not have access to this page"
      redirect_to root_path
    end
  end

  def shelter_params
    params.require(:shelter).permit(:name, :slug, :address, :user)
  end
end
