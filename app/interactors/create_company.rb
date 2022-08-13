class CreateCompany
  include Interactor::Organizer
  include TransactionalInteractor

  organize CreatesCompany::Create
end
