Rails.application.routes.draw do

  # Overview Pages

  get("/", { :controller => "application", :action => "index" })
  get("/strategies", { :controller => "application", :action => "strategies" })
  get("/predict", { :controller => "application", :action => "predict" })

  #------------------------------

  # Routes for the Nominee resource:

  # CREATE
  #post("/insert_nominee", { :controller => "nominees", :action => "create" })
          
  # READ
  get("/nominees", { :controller => "nominees", :action => "index" })
  
  get("/nominees/:path_id", { :controller => "nominees", :action => "show" })
  
  # UPDATE
  
  post("/modify_nominee/:path_id", { :controller => "nominees", :action => "update" })
  
  # DELETE
  get("/delete_nominee/:path_id", { :controller => "nominees", :action => "destroy" })

  #------------------------------

  # Routes for the Ballot resource:

  # CREATE
  post("/insert_ballot", { :controller => "ballots", :action => "create" })
          
  # READ
  get("/ballots", { :controller => "ballots", :action => "index" })
  
  get("/ballots/:path_id", { :controller => "ballots", :action => "show" })
  
  # UPDATE
  
  post("/modify_ballot/:path_id", { :controller => "ballots", :action => "update" })
  
  # DELETE
  get("/delete_ballot/:path_id", { :controller => "ballots", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
