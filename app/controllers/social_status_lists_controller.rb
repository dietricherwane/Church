class SocialStatusListsController < ApplicationController

  layout "administrator"

  def index
    @social_status_list = SocialStatusList.new
  end

  def create
    @social_status_list = SocialStatusList.new(params[:social_status_list])

    if @social_status_list.save
      @social_status_list = SocialStatusList.new
      flash.now[:success] = 'Le statut social a été créé.'
    else
      flash.now[:error] = @social_status_list.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end
    render :index
  end

  def show
    @social_status_lists = SocialStatusList.all
  end

  def edit
    @social_status_list = SocialStatusList.find_by_id(params[:id])

    if @social_status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @social_status_list = SocialStatusList.find_by_id(params[:id])
    @social_status_list_name = @social_status_list.name

    if @social_status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      if @social_status_list.update(params[:social_status_list])
        flash.now[:success] = "Le statut social #{@social_status_list.name} a été mis à jour."
      else
        flash.now[:error] = @social_status_list.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
      end

      render :edit
    end
  end

  def enable
    @social_status_list = SocialStatusList.find_by_id(params[:id])

    enable_disable(true, 'activé')
  end

  def disable
    @social_status_list = SocialStatusList.find_by_id(params[:id])

    enable_disable(false, 'désactivé')
  end

  def enable_disable(status, message)
    if @social_status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @social_status_list.update_attribute(:published, status)
      @social_status_lists = SocialStatusList.all
      flash.now[:notice] = "Le statut social #{@social_status_list.name} a été #{message}."
    end

    render :show
  end
end
