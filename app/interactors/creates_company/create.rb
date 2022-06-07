module CreatesCompany
  class Create
    include Interactor

    delegate :company_params, to: :context

    def call
      context.company = company

      raise_error if company.invalid?
    end

    private

    def company
      @company ||= Company.create(company_params)
    end

    def raise_error
      context.fail!(error: I18n.t("flash.users.company.failure"))
    end
  end
end
