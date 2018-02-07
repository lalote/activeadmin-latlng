module ActiveAdmin
  module Views
    class GoogleMapProxy < LatlngProxy
      def key
        @api_key ? "&key=#{@api_key}" : ""
      end

      def loading_map_code
        @loading_map ? "<script src=\"https://maps.googleapis.com/maps/api/js?language=#{@lang}#{key}&libraries=places&callback=googleMapObject.init\" async defer></script>" : ''
      end

      def to_s
        File.open(File.expand_path('../templates/google.html', __FILE__)).read % [loading_map_code, @height, @id_lat, @id_lng, @id_latlng, @map_zoom, @default_lat, @default_lng]
      end
    end
  end
end
