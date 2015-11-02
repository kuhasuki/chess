class Employee
  attr_reader :name, :title, :salary, :manager

  def initialize(name, title, salary, manager)
    @name, @title, @salary = name, title, salary
    @manager = manager
    @subordinates = []
  end

  def subordinates
    @subordinates.dup
  end

  def manager=(manager)
    return if self.manager == manager

    if self.manager
      self.manager._subordinates.delete(self)
    end

    # No new manager to add this to.
    @manager = manager
    self.manager._subordinates << self unless self.manager.nil?

    self
  end

  def bonus(multiplier)
    return @salary * multiplier if subordinates.empty?

    total_salaries = 0
    queue = subordinates
    until queue.empty?
      this_subordinate = queue.shift
      queue.concat(this_subordinate.subordinates)
      total_salaries += this_subordinate.salary
    end

    total_salaries * multiplier
  end

  # def add_subordinate(subordinate)
  #   subordinate.manager = self
  # end

  # def remove_subordinate(subordinate)
  #   if subordinate && !self.subordinates.include?(subordinate)
  #     raise "Tried to remove node that isn't a subordinate"
  #   end
  #
  #   subordinate.manager = nil
  # end

  protected
  def _subordinates
    @subordinates
  end
end
