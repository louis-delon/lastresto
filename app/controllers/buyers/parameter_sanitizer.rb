class Buyer::ParameterSanitizer < Devise::ParameterSanitizer

  def initialize(*)
    super
    # allow to add others strong parameters in devise for creation of a user
    permit(
            :sign_up,
            keys: [
                    :email,
                    :pseudo,
                    :first_name,
                    :last_name,
                    :avatar,
                    :phone,                  ]
          )
  end
end

