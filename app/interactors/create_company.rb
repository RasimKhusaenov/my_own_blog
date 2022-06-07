class CreateCompany
  include Interactor::Organizer
  include TransactionalInteractor

  organize CreatesCompany::Create, CreatesCompany::SetupOwner
end
