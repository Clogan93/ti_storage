class InsuranceProvidersController < ApplicationController
  def create
    if current_cart.update_attributes(insurance_provider_params)
      @success = true
    else
      @success = false
    end
    @cart = CartPresenter.new(current_cart, view_context)
  end

  private

  def insurance_provider
    @insurance_provider ||= current_cart.site.insurance_providers.where(id: params[:insurance_provider][:insurance_option_id].to_i).first
  end

  def insurance_provider_params
    params.require(:insurance_provider).permit(:insurance_option_id).merge({ insurance_provider_data: insurance_provider })
  end
end
