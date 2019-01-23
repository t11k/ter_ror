module TerRor
  class Railtie < ::Rails::Railtie
    initializer 'ter_ror' do |app|
      TerRor.init(app)
    end
  end
end
