class WsdlMtnsController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  # GetBill
  soap_action "get_bill",
              :args   => { :Reference => :string },
              :return => :string
  def get_bill
    @bill = Devoted.find_by_firstname(params[:Reference])

    render :soap => "Duke".to_s
  end
end
