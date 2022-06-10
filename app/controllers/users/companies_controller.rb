module Users
  class CompaniesController < BaseController
    expose :company

    def new; end

    def create
      self.company = create_company.company

      if create_company.success?
        respond_with company, location: root_path
      else
        respond_with company, alert: create_company.error
      end
    end

    private

    def authorize_resource!
      authorize! company
    end

    def company_params
      params.require(:company).permit(:official_name, :unofficial_name)
    end

    def create_company
      @create_company ||= CreateCompany.call(company_params: company_params, user: current_user)
    end
  end
end
