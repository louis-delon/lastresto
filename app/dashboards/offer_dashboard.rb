require "administrate/base_dashboard"

class OfferDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    seller: Field::BelongsTo,
    category: Field::BelongsTo,
    reservations: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    price: Field::String,
    date: Field::DateTime,
    duration: Field::String,
    description: Field::String,
    file: Field::String,
    quantity: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :seller,
    :category,
    :reservations,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :seller,
    :category,
    :reservations,
    :id,
    :title,
    :price,
    :date,
    :duration,
    :description,
    :file,
    :quantity,
    :created_at,
    :updated_at,
    :image,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :seller,
    :category,
    :reservations,
    :title,
    :price,
    :date,
    :duration,
    :description,
    :file,
    :quantity,
    :image,
  ].freeze

  # Overwrite this method to customize how offers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(offer)
  #   "Offer ##{offer.id}"
  # end
end
