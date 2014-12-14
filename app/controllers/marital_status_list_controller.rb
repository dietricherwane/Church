class MaritalStatusListController < ApplicationController

  layout "administrator"

  def index
    @marital_status_list = MaritalStatusList.new
  end

  def create
    @marital_status_list = MaritalStatusList.new(params[:marital_status_list])

    if @marital_status_list.save
      @marital_status_list = MaritalStatusList.new
      flash.now[:success] = 'Le statut matrimonial a été créé.'
    else
      flash.now[:error] = @marital_status_list.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end
    render :index
  end

  def show
    @marital_status_lists = MaritalStatusList.all
  end

  def edit
    @marital_status_list = MaritalStatusList.find_by_id(params[:id])

    if @marital_status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @marital_status_list = MaritalStatusList.find_by_id(params[:id])
    @marital_status_list_name = @marital_status_list.name

    if @marital_status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      if @marital_status_list.update(params[:marital_status_list])
        flash.now[:success] = "Le statut matrimonial #{@marital_status_list.name} a été mis à jour."
      else
        flash.now[:error] = @marital_status_list.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
      end

      render :edit
    end
  end

  def enable
    @marital_status_list = MaritalStatusList.find_by_id(params[:id])

    enable_disable(true, 'activé')
  end

  def disable
    @marital_status_list = MaritalStatusList.find_by_id(params[:id])

    enable_disable(false, 'désactivé')
  end

  def enable_disable(status, message)
    if @marital_status_list.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @marital_status_list.update_attribute(:published, status)
      @marital_status_lists = MaritalStatusList.all
      flash.now[:notice] = "Le statut matrimonial #{@marital_status_list.name} a été #{message}."
    end

    render :show
  end
end
