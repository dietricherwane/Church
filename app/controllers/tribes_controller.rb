class TribesController < ApplicationController
  layout "administrator"

  def index
    @tribe = Tribe.new
  end

  def create
    @tribe = Tribe.new(params[:tribe])

    if @tribe.save
      @tribe = Tribe.new
      flash.now[:success] = "L'ethnie a été créée."
    else
      flash.now[:error] = @tribe.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end
    render :index
  end

  def show
    @tribes = Tribe.all
  end

  def edit
    @tribe = Tribe.find_by_id(params[:id])

    if @tribe.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @tribe = Tribe.find_by_id(params[:id])
    @tribe_name = @tribe.name

    if @tribe.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      if @tribe.update(params[:tribe])
        flash.now[:success] = "L'ethnie #{@tribe.name} a été mise à jour."
      else
        flash.now[:error] = @tribe.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
      end

      render :edit
    end
  end

  def enable
    @tribe = Tribe.find_by_id(params[:id])

    enable_disable(true, 'activée')
  end

  def disable
    @tribe = Tribe.find_by_id(params[:id])

    enable_disable(false, 'désactivée')
  end

  def enable_disable(status, message)
    if @tribe.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @tribe.update_attribute(:published, status)
      @tribes = Tribe.all
      flash.now[:notice] = "L'ethnie #{@tribe.name} a été #{message}."
    end

    render :show
  end
end
