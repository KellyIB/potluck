class Potluck
  attr_reader :date, :dishes, :menu_by_category, :appetizers, :entres, :desserts,
              :total_dishes, :total_for_category, :ratio
  # attr_accessor :dishes

  def initialize(date)
    @date = date
    @dishes = []
    @menu_by_category = {}
    @appetizers = []
    @entres = []
    @desserts = []
    @ratio = 0
    @total_dishes = 0
    @total_for_category = 0
  end


  def add_dish(dish)
    dishes << dish
  end

  def get_all_from_category(category)
        dishes.select do |dish|
        dish.category == category
      end

  end

  def menu
    sort_menu
    @menu_by_category
  end



  def sort_menu
    dishes.each do |dish|
      if dish.category == :appetizer
        @appetizers << dish.name
        @appetizers.sort!
      else
        if dish.category == :entre
          @entres << dish.name
          @entres.sort!
      else
        dish.category == :dessert
          @desserts << dish.name
          @desserts.sort!
      end
    end
      @menu_by_category[:appetizer] = @appetizers
      @menu_by_category[:entre] = @entres
      @menu_by_category[:dessert] = @desserts
    end
  end

  def ratio(category)
    @total_for_category = dishes.count do |dish|
      dish.category == category
    end

    @total_dishes = dishes.count

    @ratio = (total_for_category/total_dishes.to_f) * 100
 end

























end
