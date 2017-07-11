class Pokemon
  attr_accessor :id, :index, :name, :location, :day, :shiny

  def self.open_connection
    PG.connect(dbname: "pokedex")
  end

  def self.hydrate pokemon_data
    pokemon = self.new

    pokemon.id = pokemon_data['id']
    pokemon.index = pokemon_data['index']
    pokemon.name = pokemon_data['name']
    pokemon.location = pokemon_data['location']
    pokemon.day = pokemon_data['day']
    pokemon.shiny = pokemon_data['shiny']

    pokemon
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM pokemon ORDER BY index"
    results = conn.exec(sql)
    pokemon = results.map do |value|
      self.hydrate value
    end
    pokemon
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM pokemon WHERE id = #{id}"
    pokemon = conn.exec(sql)
    self.hydrate pokemon.first
  end

  def save
    conn = Pokemon.open_connection
    sql = "INSERT INTO pokemon (index, name, location, day, shiny) VALUES ('#{self.index}', '#{self.name}', '#{self.location}', '#{self.day}', '#{self.shiny}')"
    conn.exec(sql)
  end

  def update
    conn = Pokemon.open_connection
    sql = "UPDATE pokemon SET index='#{index}', name='#{name}', location='#{location}', day='#{day}', shiny='#{shiny}' WHERE id = #{id}"
    conn.exec(sql)
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM pokemon WHERE id = #{id}"
    conn.exec(sql)
  end
end