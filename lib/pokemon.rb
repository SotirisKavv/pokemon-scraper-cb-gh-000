class Pokemon

  attr_accessor :name, :id, :type, :db

  def initialize(init_hash)
    init_hash.each do |k, v|
      self.send("#{k}=", v)
    end
    self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
  end

  def self.find(id, db)
    ret = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    pokemon = Pokemon.new({id:ret[0][0], name:ret[0][1], type:ret[0][2]})
  end
end
