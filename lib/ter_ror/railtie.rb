module TerRor
  class Railtie < ::Rails::Railtie
    initializer 'ter_ror' do |app|
      TerRor.load(app.root)
    end
  end
end
