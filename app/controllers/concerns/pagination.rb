module Pagination
  extend ActiveSupport::Concern

  include Pagy::Backend

  included do
    helper_method :paginator

    def paginate(relation)
      @paginator, collection = pagy(relation)
      collection
    end

    attr_reader :paginator
  end
end
