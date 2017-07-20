class ClericsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_if_admin, except: [:index, :show]
  before_action :find_cleric, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @clerics = Cleric.all
  end

  def show
  end

  def new
    @cleric = Cleric.new
  end

  def create
    @cleric = Cleric.create(cleric_params)
    @cleric.errors.empty? ? (redirect_to clerics_path) : (render 'new')
  end

  def edit
  end

  def update
    if current_user.admin?
      @cleric.update(cleric_params)
      redirect_to @cleric if @cleric.errors.empty?
    else
      render file: "#{Rails.root}/public/403.html", status: 403, layout:false
    end
  end

  def delete
  end

  def destroy
    @cleric.destroy
    redirect_to clerics_path
  end

  private
    def check_if_admin
      render file: "#{Rails.root}/public/403.html", status: 403, layout: false unless current_user.admin == true
    end

    def find_cleric
      @cleric = Cleric.find(params[:id])
    end

    def cleric_params
      params.require(:cleric).permit(:name, :position, :image)
    end

end
