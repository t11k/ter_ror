module TerRor
  module Controller
    def render_terrors(object)
      render json: {errors: object.terrors}, status: :unprocessable_entity
    end
  end
end
