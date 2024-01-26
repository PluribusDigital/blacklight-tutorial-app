# frozen_string_literal: true
class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior

  ##
  # @example Adding a new step to the processor chain
  self.default_processor_chain += [:add_author_only_qf]

  def add_custom_data_to_query(solr_parameters)
    solr_parameters[:custom] = blacklight_params[:user_value]
  end

  def add_author_only_qf(solr_parameters)
    solr_parameters[:qf] = 'author_tsim' if blacklight_params[:author]
  end
end
