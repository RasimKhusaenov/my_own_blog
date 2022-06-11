module RegistersUser
  class CreateUser
    include Interactor

    delegate :user_params, to: :context

    def call
      context.user = user

      raise_error if user.invalid?
    end

    private

    def user
      @user ||= User.create(user_params)
    end

    def raise_error
      context.fail!(error: I18n.t("flash.companies.registrations.create.failure"))
    end
  end
end
