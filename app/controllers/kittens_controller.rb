class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:notice] = "Kitten succesfully created!"
      redirect_to kitten_path(@kitten)
    else
      flash[:alert] = "Fix your errors!"
      render :new
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    
    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten succesfully updated!"
      redirect_to kitten_path(@kitten)
    else
      flash[:alert] = "Fix your errors!"
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = "Kitten succesfully deleted!"

    redirect_to kittens_path
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
