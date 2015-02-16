$(document).on ('page:change', function() {

  var buttons = $("[id^=btn-]");

  buttons.click( function (event) {

    current_id = event.currentTarget.id
    form_element = event.currentTarget.form
    
    switch ( true ) {

      // user clicked on back from pretty much anywhere
      case ( current_id.match(/^btn-back/) == "btn-back" ) :
        $("#_method").val("get");
        $(form_element).attr("action","/recipes" );
        $(form_element).attr("method","get" );
        $(form_element).submit()
        break;

      // user clicked on back from pretty much anywhere
      case ( current_id.match(/^btn-show/) == "btn-show" ) :
        $("#_method").val("get");
        $(form_element).attr("action","/recipes/" + event.currentTarget.id.slice(9) );
        $(form_element).attr("method","get" );
        $(form_element).submit()
        break;

      // user clicked on Create from the add display
      case ( current_id.match(/^btn-create/) == "btn-create" ) :
        $("#_method").val("post");
        $(form_element).attr("action","/recipes" );
        $(form_element).attr("method","post" );
        $(form_element).submit()
        break;


      // user clicked on an edit button in the list
      case ( current_id.match(/^btn-edit/) == "btn-edit" ) :
        $("#_method").val("get");
        $("#recipe-form").attr("action","/recipes/" + event.currentTarget.id.slice(16) + "/edit" );
        $("#recipe-form").submit()
        break;

      // user clicked on the add button on the main recipes list
      case ( current_id.match(/^btn-add/) == "btn-add" ) :
        $("#_method").val("get");
        $("#recipe-form").attr("action","/recipes/new" );
        $("#recipe-form").submit()
        break;

      // user clicked on the update button on the Edit display
      case ( current_id.match(/^btn-update/) == "btn-update" ) :
        $("#_method").val("patch");
        $(form_element).attr("action","/recipes/" + event.currentTarget.id.slice(11) );
        $(form_element).submit()
        break;

      // user clicked on an delete button in the list
      case ( current_id.match(/^btn-delete/) == "btn-delete" ) :
        $("#_method").val("delete");
        $("#recipe-form").attr("action","/recipes/" + event.currentTarget.id.slice(18) );
        $("#recipe-form").submit()
        break;

    }

  });

});
