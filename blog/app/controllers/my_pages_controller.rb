class MyPagesController < Simplemvc::Controller
  def about
    render :about, name: 'Alex', last_name: 'Purkhalo'
  end
end