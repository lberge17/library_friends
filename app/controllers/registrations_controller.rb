class RegistrationsController < Devise::RegistrationsController
    # The Configure Permitted Params method is uses so devise will allow a name attribute through upon signup
    before_action :configure_sign_up_params, if: :devise_controller?

    private

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end