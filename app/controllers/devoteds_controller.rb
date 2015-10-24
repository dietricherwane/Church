class DevotedsController < ApplicationController

  layout "administrator"

  def index
    @devoted = Devoted.new

    initialize_index
  end

  def create
    @devoted = Devoted.new(params[:devoted])
    initialize_index

    if @devoted.save
      # Save status
      status = Status.create(status_list_id: @devoted.status_id, devoted_id: @devoted.id)
      if status.status_list_id == StatusList.baptised_id
        Baptism.create(params[:baptism].merge({status_id: status.id}))
      end

      # Save marital status
      marital_status = MaritalStatus.create(marital_status_list_id: @devoted.marital_status_id, devoted_id: @devoted.id)
      if [MaritalStatusList.married_id, MaritalStatusList.fiance_id, MaritalStatusList.widowed_id, MaritalStatusList.concubine_id].include?(marital_status.marital_status_list_id)
        Married.create(params[:married].merge({marital_status_id: marital_status.id}))
      end

      # Save student status
      social_status = SocialStatus.create(social_status_list_id: @devoted.social_status_id, devoted_id: @devoted.id)
      if social_status.social_status_list_id == SocialStatusList.student_id
        Student.create(params[:student].merge({social_status_id: social_status.id}))
      end

      # Save employee status
      if social_status.social_status_list_id == SocialStatusList.employee_id
        Student.create(params[:employee].merge({social_status_id: social_status.id}))
      end

      @devoted = Devoted.new
      flash.now[:success] = 'Le fidèle a été créé.'
    else
      flash.now[:error] = @devoted.errors.full_messages.map{ |msg| "#{msg}<br />" }.join
    end

    render :index
  end

  def show
    @devoteds = Devoted.all
  end

  def edit
    @devoted = Devoted.find_by_id(params[:id])
    initialize_index

    if @devoted.blank?
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
    @devoted = Devoted.find_by_id(params[:id])

    enable_disable(true, 'activé')
  end

  def disable
    @devoted = Devoted.find_by_id(params[:id])

    enable_disable(false, 'désactivé')
  end

  def enable_disable(status, message)
    if @devoted.blank?
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      @devoted.update_attribute(:published, status)
      @devoteds = Devoted.all
      flash.now[:notice] = "Le profil du fidèle #{@devoted.full_name} a été #{message}."
    end

    render :show
  end

  def initialize_index
    @baptist_responsibilities = BaptistResponsibility.where(published: [nil, true])
    @tribes = Tribe.where(published: [nil, true])
    @status_lists = StatusList.where(published: [nil, true])
    @marital_status_lists = MaritalStatusList.where(published: [nil, true])
    @social_status_lists = SocialStatusList.where(published: [nil, true])
  end

end
