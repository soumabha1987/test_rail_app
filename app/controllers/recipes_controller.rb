class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show, :edit, :update]
  before_action :require_same_user, only:[:edit, :update]
  before_action :require_user, except:[:index, :show]
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end
  
  def show
    
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(current_user)
    
    if @recipe.save
      flash[:success] = "Your recipe was created successfully"
      redirect_to recipes_path
    else
      render :new
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was updated successfully"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    @recipe = Recipe.find(params[:id])
    Like.create(likes: params[:like], chef: current_user, recipe: @recipe)
    flash[:success] = "Your selection is successfull"
    redirect_to :back
  end
  
  private
    
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
    def require_same_user
      if current_user != @recipe.chef
        redirect_to root_path
      end
    end
    

end