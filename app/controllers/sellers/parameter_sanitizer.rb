class Sellers::ParameterSanitizer < Devise::ParameterSanitizer

  def initialize(*)
    super
    # allow to overide default devise strong parameters for creation of a user
    permit(
            :sign_up,
            keys: [
                    :email,
                    :name,
                    :address,
                    :zip_code,
                    :city,
                    :phone_number,
                    :avatar
                  ]
          )
    # allow to overide default devise strong parameters for updating a user
    permit(
            :account_update,
            keys: [
                    :email,
                    :name,
                    :address,
                    :zip_code,
                    :city,
                    :phone_number,
                    :avatar
                  ]
          )
  end

end

