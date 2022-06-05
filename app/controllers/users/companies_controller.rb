module Users
  class CompaniesController < BaseController
    expose :company

    def new; end

    def create
      result = CreateCompany.call(company_params: company_params, user: current_user)

      if result.success?
        respond_with company, location: root_path
      else
        redirect_to new_users_company_path
      end
    end

    private

    def authorize_resource!
      authorize! company
    end

    def company_params
      params.require(:company).permit(:official_name, :unofficial_name)
    end
  end
end
