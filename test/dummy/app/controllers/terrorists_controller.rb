class TerroristsController < ApplicationController
  def create
    terrorist = Terrorist.new(terrorist_params)

    if terrorist.save
      head :ok
    else
      render_terrors(terrorist)
    end
  end

  private

  def terrorist_params
    params.require(:terrorist).permit(:name)
  end
end
