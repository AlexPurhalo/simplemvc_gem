class MyPagesController < Simplemvc::Controller
  def about
    render :about, name: 'Alex', last_name: 'Purkhalo'
  end

  def tell_me
    puts 'before'
    render :tell_me, name: params['name']
    puts 'after'
  end
end