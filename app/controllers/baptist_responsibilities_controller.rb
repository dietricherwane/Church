class BaptistResponsibilitiesController < ApplicationController

  layout "administrator"

  def index
    @baptist_responsibility = BaptistResponsibility.new
  end

  def create
    @baptist_responsibility = BaptistResponsibility.new(params[:baptist_responsibility])

    if @baptist_responsibility.save
      @baptist_responsibility = BaptistResponsibility.new
      flash.now[:success] = 'La responsabilité a été créée.'
    else
      flash.now[:error] = @baptist_responsibility.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end
    render :index
  end

  def show
    @baptist_responsibilities = BaptistResponsibility.all
  end

  def edit
    @baptist_responsibility = BaptistResponsibility.find_by_id(params[:id])

    if @baptist_responsibility.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end
  end

  def update
    @baptist_responsibility = BaptistResponsibility.find_by_id(params[:id])
    @baptist_responsibility_name = @baptist_responsibility.name

    if @baptist_responsibility.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      if @baptist_responsibility.update(params[:baptist_responsibility])
        flash.now[:success] = "La responsabilité #{@baptist_responsibility.name} a été mise à jour."
      else
        flash.now[:error] = @baptist_responsibility.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
      end

      render :edit
    end
  end

  def enable
    @baptist_responsibility = BaptistResponsibility.find_by_id(params[:id])

    enable_disable(true, 'activée')
  end

  def disable
    @baptist_responsibility = BaptistResponsibility.find_by_id(params[:id])

    enable_disable(false, 'désactivée')
  end

  def enable_disable(status, message)
    if @baptist_responsibility.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @baptist_responsibility.update_attribute(:published, status)
      @baptist_responsibilities = BaptistResponsibility.all
      flash.now[:notice] = "La responsabilité #{@baptist_responsibility.name} a été #{message}."
    end

    render :show
  end
end
