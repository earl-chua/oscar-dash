class NomineesController < ApplicationController
  def index
    matching_nominees = Nominee.all

    @list_of_nominees = matching_nominees.order({ :ceremony_year => :desc })

    render({ :template => "nominees/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_nominees = Nominee.where({ :id => the_id })

    @the_nominee = matching_nominees.at(0)

    render({ :template => "nominees/show.html.erb" })
  end

  def create
    the_nominee = Nominee.new
    the_nominee.nom_name = params.fetch("query_nom_name")
    the_nominee.ceremony_year = params.fetch("query_ceremony_year")
    the_nominee.category = params.fetch("query_category")
    the_nominee.winner = params.fetch("query_winner", false)
    the_nominee.ballots_count = params.fetch("query_ballots_count")

    if the_nominee.valid?
      the_nominee.save
      redirect_to("/nominees", { :notice => "Nominee created successfully." })
    else
      redirect_to("/nominees", { :notice => "Nominee failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_nominee = Nominee.where({ :id => the_id }).at(0)

    the_nominee.nom_name = params.fetch("query_nom_name")
    the_nominee.ceremony_year = params.fetch("query_ceremony_year")
    the_nominee.category = params.fetch("query_category")
    the_nominee.winner = params.fetch("query_winner", false)
    the_nominee.ballots_count = params.fetch("query_ballots_count")

    if the_nominee.valid?
      the_nominee.save
      redirect_to("/nominees/#{the_nominee.id}", { :notice => "Nominee updated successfully."} )
    else
      redirect_to("/nominees/#{the_nominee.id}", { :alert => "Nominee failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_nominee = Nominee.where({ :id => the_id }).at(0)

    the_nominee.destroy

    redirect_to("/nominees", { :notice => "Nominee deleted successfully."} )
  end
end
