class IndexController < ApplicationController
  def index
    @animal_behaviors = AnimalBehavior.all
    @checked_behaviors = params

    if is_mammal?
      @animal = "哺乳动物"
      if is_carnivore?
        @animal = "食肉动物"
        # IF该动物是食肉动物 AND是黄褐色 AND身上有黑色条纹 THEN该动物是老虎
        if is_carnivore? && params[:brown] && params[:black_stripes]
          @animal = "老虎"
        # IF该动物是肉食动物 AND是黄褐色 AND身上有黑色斑点 THEN该动物是金钱豹 
        elsif is_carnivore? && params[:brown] && params[:black_spots]
          @animal = "金钱豹"
        # IF该动物是有蹄类动物 AND有长脖子 AND有长腿 AND是黄褐色AND身上有暗斑点 THEN该动物是长颈鹿
        elsif is_ungulates? && params[:long_neck] && params[:long_legs] && params[:brown] && params[:dark_spots]
          @animal = "长颈鹿"
        # IF该动物是有蹄类动物 AND是白色 AND身上有黑色条纹 THEN该动物是斑马
        elsif is_ungulates? && params[:white] && params[:black_stripes]
          @animal = "斑马"
        end
      end
    elsif is_bird?
      @animal = "鸟类"
      # IF该动物是鸟 AND有不会飞AND有长腿 AND长脖子 AND是黑白色 THEN 该动物 是鸵鸟
      if is_bird? && params[:can_not_fly] && params[:long_legs] && params[:long_neck] && params[black_and_white]
        @animal = "鸵鸟"
      # IF该动物是鸟 AND不会飞 AND会游泳 AND是黑白色 THEN该动物是企鹅
      elsif is_bird? && params[:can_not_fly] && params[:can_swim] && params[:black_and_white]
        @animal = "企鹅"
      # IF该动物是鸟 AND善飞 AND不怕风浪 THEN该动物是信天翁
      elsif is_bird? && params[:good_at_fly] && params[:not_afraid_of_storms]
        @animal = "信天翁"
      end
    else
      @animal = "信息太少无法准确推断"
    end
  end

  private
    # 哺乳动物
    def is_mammal?
      params[:have_hair] || params[:have_milk]
    end

    # 鸟
    def is_bird?
      params[:have_feather] || (params[:can_fly] && params[:raw_eggs])
    end

    # 肉食动物
    def is_carnivore?
      (is_mammal? && params[:have_claws] && params[:have_canines] && params[:eyes_glued_to_the_front]) || (is_mammal? && params[:eat_meat])
    end

    # 蹄类动物
    def is_ungulates?
      is_mammal? && params[:have_ungulate]
    end

    # 偶蹄动物
    def is_artiodactyl?
      is_ungulates? && params[:cud]
    end
end
