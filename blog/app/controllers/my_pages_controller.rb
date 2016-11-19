class MyPagesController < Simplemvc::Controller
  attr_reader :name

  def about
    render :about, name: 'Alex', last_name: 'Purkhalo'
  end

  def tell_me
    @name = 'Alex'
  end
end