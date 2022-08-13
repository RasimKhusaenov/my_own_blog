module Users
  class CompaniesController < Users::BaseController
    expose :company

    def new; end

    def create
      respond_with create_company.company,
                   location: root_url(subdomain: create_company.company.slug)
    end

    private

    def authorize_resource!
      authorize! company
    end

    def company_params
      params.require(:company).permit(:official_name).merge(owner: current_user)
    end

    def create_company
      @create_company ||= CreateCompany.call(company_params: company_params)
    end
  end
end
