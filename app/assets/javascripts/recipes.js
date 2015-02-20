$(document).on ('page:change', function() {

  var buttons = $("[id^=btn-]");

    $("#recipe-body").click( function (event) {
      target = event.target
      recipe_id = $(target).closest("tr")[0].id.slice(7);
      form_element = event.currentTarget.parentElement.parentElement;
      $("#_method").val("get");
      $(form_element).attr("method","get" );
      $(form_element).attr("action","/recipes/" + recipe_id );
      $(form_element).submit();
      return false;
    });

  buttons.click( function (event) {

    current_id = event.currentTarget.id
    form_element = event.currentTarget.form

    switch ( true ) {

    /* ==================================================================
     * Ingredient related button clicks
     * ==================================================================
     */

    // user clicked on an delete button in the list
    case ( current_id.match(/^btn-add-ingredient/) == "btn-add-ingredient" ) :
      $("#_method").val("post");
      $(form_element).attr("method","post" );
      $(form_element).attr("action","/add_new_ingredient/" + $("#recipe_id").val() );
      $(form_element).submit()
      break;

     // user clicked on an delete button in the list
     case ( current_id.match(/^btn-delete-ingredient/) == "btn-delete-ingredient" ) :
       $("#_method").val("delete");
       $(form_element).attr("action","/recipes/" + $("#recipe_id").val() + "/ingredients/" + current_id.slice(22) );
       $(form_element).submit()
       break;

      /* ==================================================================
       * Recipe related button clicks
       * ==================================================================
       */

      // user clicked on back from pretty much anywhere
      case ( current_id.match(/^btn-back-recipe/) == "btn-back-recipe" ) :
        $("#_method").val("get");
        $(form_element).attr("action","/recipes" );
        $(form_element).attr("method","get" );
        $(form_element).submit()
        break;

      // user clicked on back from pretty much anywhere
      case ( current_id.match(/^btn-show-recipe/) == "btn-show-recipe" ) :
        $("#_method").val("get");
        $(form_element).attr("action","/recipes/" + current_id.slice(16) );
        $(form_element).attr("method","get" );
        $(form_element).submit()
        break;

      // user clicked on Create from the add display
      case ( current_id.match(/^btn-create-recipe/) == "btn-create-recipe" ) :
        $("#_method").val("post");
        $(form_element).attr("action","/recipes" );
        $(form_element).attr("method","post" );
        $(form_element).submit()
        break;


      // user clicked on an edit button in the list
      case ( current_id.match(/^btn-edit-recipe/) == "btn-edit-recipe" ) :
        $("#_method").val("get");
        $(form_element).attr("method","get" );
        $(form_element).attr("action","/recipes/" + event.currentTarget.id.slice(16) + "/edit" );
        $(form_element).submit()
        break;

      // user clicked on the add button on the main recipes list
      case ( current_id.match(/^btn-add-recipe/) == "btn-add-recipe" ) :
        $("#_method").val("get");
        $(form_element).attr("method","get" );
        $(form_element).attr("action","/recipes/new" );
        $(form_element).submit()
        break;

      // user clicked on the update button on the Edit display
      case ( current_id.match(/^btn-update-recipe/) == "btn-update-recipe" ) :
        $("#_method").val("patch");
        $(form_element).attr("action","/recipes/" + current_id.slice(18) );
        $(form_element).submit()
        break;

      // user clicked on an delete button in the list
      case ( current_id.match(/^btn-delete-recipe/) == "btn-delete-recipe" ) :
        $("#_method").val("delete");
        $(form_element).attr("action","/recipes/" + current_id.slice(18) );
        $(form_element).submit()
        break;


      // user clicked on the add button on the main recipes list
      case ( current_id.match(/^btn-add-comment/) == "btn-add-comment" ) :
        $("#_method").val("get");
        $(form_element).attr("method","get" );
        $(form_element).attr("action","/recipes/" + $("#recipe_id").val() + "/comments/new" );
        $(form_element).submit()
        break;

    }

  });

});
