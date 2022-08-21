module RegistersUser
  class MakeWriter
    include Interactor

    delegate :company, :user, to: :context

    def call
      return if company.blank?

      raise_error if member.invalid?
    end

    private

    def member
      CompanyMember.create(company: company, user: user, role: :writer)
    end

    def raise_error
      context.fail!(error: I18n.t("flash.companies.registrations.create.failure"))
    end
  end
end
