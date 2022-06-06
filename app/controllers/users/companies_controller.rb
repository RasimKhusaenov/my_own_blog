module Users
  class CompaniesController < BaseController
    expose :company

    def new; end

    def create
      self.company = CreateCompany.call(company_params: company_params, user: current_user).company

      respond_with company, location: root_path
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
