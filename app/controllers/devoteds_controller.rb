class DevotedsController < ApplicationController

  layout "administrator"

  def index
    @devoted = Devoted.new
    @baptism = Baptism.new
    @mate = Married.new
    @student = Student.new
    @employee = Employee.new

    @baptist_responsibilities = BaptistResponsibility.where(published: [nil, true])
    @tribes = Tribe.where(published: [nil, true])
    @status_lists = StatusList.where(published: [nil, true])
    @marital_status_lists = MaritalStatusList.where(published: [nil, true])
    @social_status_lists = SocialStatusList.where(published: [nil, true])
  end

  def create
    @devoted = Devoted.new(params[:devoted])
  end

  def show

  end

end
