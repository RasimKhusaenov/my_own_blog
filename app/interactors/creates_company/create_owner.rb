module CreatesCompany
  class CreateOwner
    include Interactor

    delegate :company, :user, to: :context

    def call
      raise_error unless member.save
    end

    private

    def member
      CompanyMember.new(company: company, user: user, role: :owner)
    end

    def raise_error
      context.fail!
    end
  end
end
