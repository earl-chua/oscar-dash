class BallotsController < ApplicationController
  def index
    matching_ballots = Ballot.all

    @list_of_ballots = matching_ballots.order({ :created_at => :desc })

    render({ :template => "ballots/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ballots = Ballot.where({ :id => the_id })

    @the_ballot = matching_ballots.at(0)

    render({ :template => "ballots/show.html.erb" })
  end

  def complete
    @the_year = params.fetch("query_ceremony_year")
    render({ :template => "ballots/main.html.erb" })
  end

  def create
    the_ballot = Ballot.new
    the_ballot.ceremony_year = params.fetch("query_ceremony_year")
    the_ballot.user_id = session[:user_id]
    the_ballot.actor_id = params.fetch("query_actor_id")
    the_ballot.actress_id = params.fetch("query_actress_id")
    the_ballot.s_actor_id = params.fetch("query_s_actor_id")
    the_ballot.s_actress_id = params.fetch("query_s_actress_id")
    the_ballot.director_id = params.fetch("query_director_id")
    the_ballot.o_screenplay_id = params.fetch("query_o_screenplay_id")
    the_ballot.a_screenplay_id = params.fetch("query_a_screenplay_id")
    the_ballot.picture_id = params.fetch("query_picture_id")

    if the_ballot.valid?
      the_ballot.save
      redirect_to("/ballots", { :notice => "Ballot created successfully." })
    else
      redirect_to("/ballots", { :notice => "Ballot failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ballot = Ballot.where({ :id => the_id }).at(0)

    the_ballot.ceremony_year = params.fetch("query_ceremony_year")
    the_ballot.user_id = params.fetch("query_user_id")
    the_ballot.actor_id = params.fetch("query_actor_id")
    the_ballot.actress_id = params.fetch("query_actress_id")
    the_ballot.s_actor_id = params.fetch("query_s_actor_id")
    the_ballot.s_actress_id = params.fetch("query_s_actress_id")
    the_ballot.director_id = params.fetch("query_director_id")
    the_ballot.o_screenplay_id = params.fetch("query_o_screenplay_id")
    the_ballot.a_screenplay_id = params.fetch("query_a_screenplay_id")
    the_ballot.picture_id = params.fetch("query_picture_id")

    if the_ballot.valid?
      the_ballot.save
      redirect_to("/ballots/#{the_ballot.id}", { :notice => "Ballot updated successfully."} )
    else
      redirect_to("/ballots/#{the_ballot.id}", { :alert => "Ballot failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ballot = Ballot.where({ :id => the_id }).at(0)

    the_ballot.destroy

    redirect_to("/ballots", { :notice => "Ballot deleted successfully."} )
  end
end
