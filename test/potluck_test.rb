require 'minitest/autorun'
require 'minitest/pride'
require './lib/potluck'
require './lib/dish'
require 'pry'

class PotluckTest <Minitest::Test

  def test_potluck_is_an_instance_of_Potluck
      potluck = Potluck.new("7-13-18")

    assert_instance_of Potluck, potluck
  end

  def test_potluck_has_a_date
    potluck = Potluck.new("7-13-18")

    assert_equal "7-13-18", potluck.date
  end

  def test_potluck_has_dishes_is_empty_array
    potluck = Potluck.new("7-13-18")

    assert_equal [], potluck.dishes
  end

  def test_potluck_can_add_dishes
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    assert_equal [couscous_salad, cocktail_meatballs], potluck.dishes
  end

  def test_can_count_how_many_dishes
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)

    assert_equal 2, potluck.dishes.length
  end

  def test_gets_all_from_category
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(candy_salad)

    assert_equal [couscous_salad, cocktail_meatballs, summer_pizza, roast_pork,
      candy_salad], potluck.dishes
  end

  def test_gets_menu_item_by_category

    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    # binding.pry
    assert_equal [couscous_salad, summer_pizza, bean_dip], potluck.get_all_from_category(:appetizer)
    assert_equal couscous_salad, potluck.get_all_from_category(:appetizer).first
    assert_equal "Couscous Salad", potluck.get_all_from_category(:appetizer).first.name
  end

  def test_lists_menu_by_category

    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    potluck.menu

    # binding.pry
    assert_equal potluck.menu_by_category, potluck.menu
    assert_equal 50.0, potluck.ratio(:appetizer)

  end



end
