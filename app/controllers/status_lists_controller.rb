class StatusListsController < ApplicationController

  layout "administrator"

  def index
    @status_list = StatusList.new
  end

  def create
    @status_list = StatusList.new(params[:status_list])

    if @status_list.save
      @status_list = StatusList.new
      flash.now[:success] = 'Le statut a été créé.'
    else
      flash.now[:error] = @status_list.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end
    render :index
  end

  def show
    @status_lists = StatusList.all
  end

  def edit
    @status_list = StatusList.find_by_id(params[:id])

    if @status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @status_list = StatusList.find_by_id(params[:id])
    @status_list_name = @status_list.name

    if @status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      if @status_list.update(params[:status_list])
        flash.now[:success] = "Le statut #{@status_list.name} a été mis à jour."
      else
        flash.now[:error] = @status_list.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
      end

      render :edit
    end
  end

  def enable
    @status_list = StatusList.find_by_id(params[:id])

    enable_disable(true, 'activé')
  end

  def disable
    @status_list = StatusList.find_by_id(params[:id])

    enable_disable(false, 'désactivé')
  end

  def enable_disable(status, message)
    if @status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @status_list.update_attribute(:published, status)
      @status_lists = StatusList.all
      flash.now[:notice] = "Le statut #{@status_list.name} a été #{message}."
    end

    render :show
  end

end
