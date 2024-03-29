require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    avatar_attachment: Field::HasOne,
    avatar_blob: Field::HasOne,
    carousels: Field::HasMany,
    venues: Field::HasMany,
    shows: Field::HasMany,
    show_applications: Field::HasMany,
    chat_users: Field::HasMany,
    chats: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    failed_attempts: Field::Number,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    locale: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    is_artist: Field::Boolean,
    is_curator: Field::Boolean,
    artist_website: Field::String,
    instagram_url: Field::String,
    gravatar_url: Field::String,
    is_admin: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :email,
    :shows,
    :show_applications,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :email,
    :first_name,
    :last_name,
    :is_artist,
    :is_curator,
    :shows,
    :show_applications,
    :artist_website,
    :instagram_url,
    :is_admin,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :email,
    :first_name,
    :last_name,
    :is_artist,
    :is_curator,
    :artist_website,
    :instagram_url,
    :is_admin,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.full_name}"
  end
end
