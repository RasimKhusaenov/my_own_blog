module CreatesCompany
  class Create
    include Interactor

    delegate :company_params, to: :context

    def call
      raise_error unless company.save
      context.company = company
    end

    private

    def company
      @company ||= Company.new(company_params)
    end

    def raise_error
      context.fail!(company: company)
    end
  end
end
