require "administrate/base_dashboard"

class ReservationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    seller: Field::BelongsTo,
    buyer: Field::BelongsTo,
    offer: Field::BelongsTo,
    id: Field::Number,
    date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    comment: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :seller,
    :buyer,
    :offer,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :seller,
    :buyer,
    :offer,
    :id,
    :date,
    :created_at,
    :updated_at,
    :comment,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :seller,
    :buyer,
    :offer,
    :date,
    :comment,
  ].freeze

  # Overwrite this method to customize how reservations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(reservation)
  #   "Reservation ##{reservation.id}"
  # end
end
