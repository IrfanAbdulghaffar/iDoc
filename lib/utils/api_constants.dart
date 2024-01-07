class APIConstants {
  static String live = "https://cyber-fuchs.de/Gewerbe-Control/api/";
  static String demo = "https://coachmeup.sitdemo.com/api/v1/";
  static String baseUrl = demo;

  //Auth
  static const postSignUp = "sign-up";
  static const login = "sign-in";
  static const postForgetPassword = "forget-password";
  static const postVerifyEmail = "verify-email";
  static const postResetForgetPassword = "reset-forget-password";
  static const postUserProfile = "user-profile";


  //profile
  static const postProfile = "user-profile";
  static const logout = "logout";

  //water
  static const postWaterIntake = "tracker/water-intake";
  static const getWaterValue = "tracker/track-water-goal";

  //dashboard
  static const getTodayWorkout = "workout/today-workout";
  static const getWeeklyWorkout = "workout/weekly-workout";
  static const getTodayMeal = "nutrition/today-meal";
  static const getCurrentWeekMeal = "nutrition/weekly-meal";

  //workout
  static const performWorkoutDetails = "workout/show/";
  static const getWorkoutCategory = "workout/categories";
  static const getWorkoutByCategory = "workout/category/";
  static const getWorkoutByName = "workout/search-workout?query=";
  static const getWorkoutByFilterList = "/workout/filter-workout?";
  static const postFavouriteWorkout = "workout/favourite/";
  static const delFavouriteWorkout = "workout/favourite/";
  static const addByDateInCalendar = "workout/calendar";
  static const postWorkoutLog = "tracker/workout";

  //Achievement
  static const completeWorkout = "tracker/track-workout/";
  static const getAllAchievement = "user-achievement";



  static const nutritionCategory = "nutrition/index";
  static const setUserGoals = "user-goal";

  //recipe
  static const getAllRecipe = "nutrition/recipe/index";
  static const showRecipe = "nutrition/recipe/show/";
  static const favouritesRecipe = "nutrition/recipe/favourites";
  static const getAllIngredients = "nutrition/ingredient/index";
  static const getIngredients = "nutrition/ingredient/show/";
  static const favIngredients = "nutrition/ingredient/favourites";
  static const getLatestIngredients = "nutrition/ingredient/lastly-used-ingredients";
  static const getLatestRecipe = "nutrition/recipe/lastly-used-recipes";
  static const addFavIngredients = "nutrition/ingredient/favourite/";
  static const removeFavIngredients = "nutrition/ingredient/favourite/";
  static const searchRecipe = "nutrition/recipe/search-recipe?query=";
  static const filterRecipe = "nutrition/recipe/filter-recipe?";
  static const addFavRecipe = "nutrition/recipe/favourite/";
  static const removeFavRecipe = "nutrition/recipe/favourite/";
  static const searchIngredient = "nutrition/ingredient/search-ingredient?query=";
  static const filterIngredient = "nutrition/ingredient/filter-ingredient?";
  static const nutritionRequest = "nutrition/plan-request";
  static const nutritionHistory = "nutrition/get-nutrition-history-by-day/";
  static const getLatestAchievement = "user-latest-achievement";
  static const getRecipeTypes = "nutrition/recipe/recipe-types";
  //calculate
  static const calculate = "nutrition/calculator";



}
