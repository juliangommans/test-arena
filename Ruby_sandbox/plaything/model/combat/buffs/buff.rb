class Buff

  attr_accessor :name, :type, :stat, :amount, :stacks, :duration, :effect, :power

  def initialize(params = {})
    @name = params[:name]
    @type = params[:type]
    @stat = params[:stat]
    @amount = params[:amount]
    @stacks = params[:stacks]
    @duration = params[:duration]
    @effect = params[:effect]
    @power = params[:power]
  end

end
