class SimpleFilterClass < Blacklight::SearchState::FilterField
  # Add a facet item to the URL parameters
  def add(item)
    new_state = search_state.reset_search

    params = new_state.params
    params[key] = as_url_parameter(item)

    new_state.reset(params)
  end

  # Remove a facet item from the URL parameters
  # Since this is a single-valued field, we can just
  # remove the whole parameter
  def remove(item)
    new_state = search_state.reset_search

    params = new_state.params

    params.delete(key)

    new_state.reset(params)
  end

  # Facet values set in the URL
  def values(except: [])
    Array(search_state.params[key])
  end

  # Is a given facet item currently selected?
  def include?(item)
    values.include? as_url_parameter(item)
  end

  def permitted_params
    [key]
  end
end