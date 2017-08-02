class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :check_if_admin, except: [:show]
  before_action :find_announcement, only: [:edit, :update, :delete, :destroy]

  def show
    @announcement = Announcement.last
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.create(announcement_params)
    @announcement.errors.empty? ? (redirect_to action: 'show', id: Announcement.last.id) : (render 'new')
  end

  def edit
  end

  def update
    if current_user.admin?
      @announcement.update(announcement_params)
      redirect_to @announcement if @announcement.errors.empty?
    else
      render file: "#{Rails.root}/public/403.html", status: 403, layout:false
    end
  end

  def delete
  end

  def destroy
    @announcement.destroy
    redirect_to root_path
  end

  private
    def check_if_admin
      render file: "#{Rails.root}/public/403.html", status: 403, layout: false unless current_user.admin == true
    end

    def find_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:title, :body)
    end

end
