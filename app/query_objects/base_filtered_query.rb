class BaseFilteredQuery
  def initialize(relation, options = {})
    @relation = relation
    @filter_params = sanitized_filter_params(options)
  end

  def all
    filter_params.reduce(relation) do |relation, (key, value)|
      method_name = "by_#{key}"
      if self.class.private_method_defined?(method_name)
        send(method_name, relation, value)
      else
        relation
      end
    end
  end

  private

  def sanitized_filter_params(params)
    params
      .to_h
      .deep_symbolize_keys
      .reject { |_, v| v.to_s.blank? }
  end

  attr_reader :relation, :filter_params
end
