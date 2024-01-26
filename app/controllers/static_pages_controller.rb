class StaticPagesController < CatalogController
  # limit fields to publication date
  configure_blacklight do |config|
    config.facet_fields.slice!('format', 'pub_date_ssim')
  end

  def home
    (@response, _) = search_service.search_results
  end
end
