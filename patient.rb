class Patient
  # State
  # - name
  # - age
  # - symptoms
  # - cured
  # - blood type
  # Behavior
  # - treat
  # - cure!
  # - check out

  attr_reader :name, :blood_type
  attr_accessor :id, :room

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type]
    @room = attributes[:room]
    @id = attributes[:id]
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end


# Patient.new
# Patient.new({ name: 'bobby' })
# Patient.new({ name: 'sally', cured: false })

