class VenueNewPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(venue)
    @page_path = edit_venue_path venue

    @name_input =                   "#venue_name"
    @latitude_input =               "#venue_latitude"
    @longitude_input =              "#venue_longitude"
    @link_input =                   "#venue_link"
    @address_input =                "#venue_address"
    @venue_type_input =             "#venue_venue_type"
    @venue_smoking_policy_input =   "#venue_smoking_policy"

    @submit_button =                "#submit"
  end

  #routing
  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end

  def create_new_venue_with_attributes( attrs )
    find(:css, @name_input ).set attrs[:name]
    find(:css, @link_input ).set attrs[:link]
    find(:css, @address_input ).set attrs[:address]
    find(:css, @venue_type_input ).set attrs[:venue_type]
    find(:css, @venue_smoking_policy_input ).set attrs[:venue_smoking_policy]

    page.find(@submit_button).click
  end
end
