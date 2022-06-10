module CreatesCompany
  class SetupOwner
    include Interactor

    delegate :company, :user, to: :context

    def call
      raise_error if member.invalid?
    end

    private

    def member
      CompanyMember.create(company: company, user: user, role: :owner)
    end

    def raise_error
      context.fail!(error: I18n.t("flash.users.companies.create.failure"))
    end
  end
end
