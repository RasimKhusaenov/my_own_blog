module Pagination
  extend ActiveSupport::Concern

  include Pagy::Backend

  included do
    helper_method :paginator

    def paginate(relation)
      @paginator, collection = pagy(relation)
      collection
    end

    def paginator
      @paginator
    end
  end
end
