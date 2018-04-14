class Seller::ParameterSanitizer < Devise::ParameterSanitizer

  def initialize(*)
    super
    # allow to add others strong parameters in devise for creation of a user
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
  end
end

