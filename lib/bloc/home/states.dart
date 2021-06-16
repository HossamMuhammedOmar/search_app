abstract class HomeStates {}

class HomeInitState extends HomeStates {}

// GET ALL CATEGORIES LOADING
class HomeLoadingCategoriesState extends HomeStates {}

class HomeChooseCategoriesState extends HomeStates {}

// GET ALL CATEGORIES SUCCESS
class HomeSucessCategoriesState extends HomeStates {}

// GET ALL CATEGORIES ERORR
class HomeErorrCategoriesState extends HomeStates {}

// GET STORES WHERE GOVERNMENT
class HomeGetStoresLoadingWhereGoverState extends HomeStates {}

// GET STORES WHERE GOVERNMENT
class HomeGetStoresSuccessWhereGoverState extends HomeStates {}

// GET STORES WHERE GOVERNMENT
class HomeGetStoresErrorWhereGoverState extends HomeStates {}

// CREATE NEW ORDER
class HomeCreateOrderLoadingState extends HomeStates {}

// CREATE NEW ORDER
class HomeCreateOrderSuccessState extends HomeStates {}

// CREATE NEW ORDER
class HomeCreateOrderErorrState extends HomeStates {}

// GET MY ORDER
class HomeGetMyOrdersLoadingState extends HomeStates {}

// GET MY ORDER
class HomeGetMyOrdersSuccessState extends HomeStates {}

// GET MY ORDER
class HomeGetMyOrdersErrorState extends HomeStates {}

class HomeGetStoresLoadingWhereGoverDetailsState extends HomeStates {}

class HomeGetStoresSuccessWhereGoverDetailsState extends HomeStates {}

// DELETE MY ORDER
class HomeDeleteMyOrderLoadingState extends HomeStates {}

class HomeDeleteMyOrderSuccessState extends HomeStates {}

class HomeDeleteMyOrderErrorState extends HomeStates {}
