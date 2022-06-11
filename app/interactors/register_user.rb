class RegisterUser
  include Interactor::Organizer
  include TransactionalInteractor

  organize RegistersUser::CreateUser, RegistersUser::MakeWriter
end
