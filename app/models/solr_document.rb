# frozen_string_literal: true

# Represents a single document returned from Solr
class SolrDocument
  include Blacklight::Solr::Document
      # The following shows how to setup this blacklight document to display marc documents
  extension_parameters[:marc_source_field] = :marc_ss
  extension_parameters[:marc_format_type] = :marcxml
  use_extension(Blacklight::Marc::DocumentExtension) do |document|
    document.key?(SolrDocument.extension_parameters[:marc_source_field])
  end

  field_semantics.merge!(
                         :title => "title_ssm",
                         :author => "author_ssm",
                         :language => "language_ssim",
                         :format => "format"
                         )



  # self.unique_key = 'id'

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  def author_name
    return unless has? 'author_tsim'

    # Don't really do this; find a way to do this wherever you have enough information
    # to do it without as many errors.
    Array(fetch('author_tsim')).map do |value|
      a, b, c = value.split(', ', 3)

      if a && b && c
        # the value had all 3 parts
        "#{b} #{a}, #{c}"
      elsif a && !b&.match?(/^\d/)
        # the value has just two parts, and the second part was probably not a year
        "#{b} #{a}"
      else
        value
      end
    end
  end
end
