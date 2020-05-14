import '../models/categories.dart';

  List <CategoryModel> getCategories(){
  List <CategoryModel> categories = new List<CategoryModel>();
  CategoryModel categoryModel;

  //adding categories
  categoryModel = CategoryModel();
  categoryModel.categoryName="business";
  categoryModel.categoryUrl="https://cdn.pixabay.com/photo/2014/05/02/21/50/home-office-336378_1280.jpg";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName="entertainment";
  categoryModel.categoryUrl="";
  categories.add(categoryModel);

   categoryModel = CategoryModel();
  categoryModel.categoryName="sports";
  categoryModel.categoryUrl="";
  categories.add(categoryModel);

   categoryModel = CategoryModel();
  categoryModel.categoryName="health";
  categoryModel.categoryUrl="";
  categories.add(categoryModel);

   categoryModel = CategoryModel();
  categoryModel.categoryName="technology";
  categoryModel.categoryUrl="";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName="world";
  categoryModel.categoryUrl="";
  categories.add(categoryModel);

return categories;
}