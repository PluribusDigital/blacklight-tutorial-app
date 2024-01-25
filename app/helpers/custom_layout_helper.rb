module CustomLayoutHelper
  include Blacklight::LayoutHelperBehavior

  ##
  # Overriden to include dir
  def html_tag_attributes
    super.merge(dir: 'rtl')
  end
end