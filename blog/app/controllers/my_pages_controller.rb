class MyPagesController < Simplemvc::Controller
  def about
    render :about, name: 'Alex', last_name: 'Purkhalo'
  end

  def tell_me
    render :tell_me, name: params['name']
  end
end