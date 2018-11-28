module Datawow
  class BaseAPI

    def base_point(model)
      {
        image: 'https://kiyo-image.datawow.io',
        ai: 'https://kiyo-image.datawow.io',
        text: 'https://kiyo-text.datawow.io',
        video: 'https://kiyo-image.datawow.io'
      }[model]
    end

  end
end
