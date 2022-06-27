module ApplicationHelper
  def list_airports
    @airports = Airport.all.order(:city)
    @airports.each_with_object([]) do |airport, result|
      result << ["#{airport.city} (#{airport.code})", airport.id]
    end
  end
end
