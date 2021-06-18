abstract class RegisterStates {}

// Initial State
class RegisterInitState extends RegisterStates {}

// SWITCH BETWEEN SCREENS
class RegisterUserEmailScreenState extends RegisterStates {}

// SWITCH BETWEEN SCREENS
class RegisterUserPhoneScreenState extends RegisterStates {}

// STATES FOR REGISTERATION PROCESS
class RegisterLoaingState extends RegisterStates {}

// STATES FOR REGISTERATION PROCESS
class RegisterSucessState extends RegisterStates {}

// STATES FOR REGISTERATION PROCESS
class RegisterErorrState extends RegisterStates {
  String? e;
  RegisterErorrState(this.e);
}

// STATES FOR REGISTERATION STORE PROCESS
class RegisterStoreLoaingState extends RegisterStates {}

// STATES FOR REGISTERATION STORE PROCESS
class RegisterStoreSucessState extends RegisterStates {}

// STATES FOR REGISTERATION STORE PROCESS
class RegisterStoreErorrState extends RegisterStates {}

class RegisterChooseCategoriesState extends RegisterStates {}

class RegisterGetCategoiresLoadingState extends RegisterStates {}

class RegisterGetCategoiresSuccessState extends RegisterStates {}

class RegisterGetCategoiresErorrState extends RegisterStates {}

class HomeChooseGovernState extends RegisterStates {}
