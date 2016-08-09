var init_stock_lookup;

init_stock_lookup = function() {
  $("#stock-lookup-form").on("ajax:success", function(event, data, status) {
    $("#stock-lookup").replaceWith(data);
    init_stock_lookup(); //need to reinit listeners
  }); //success handling
  
  $("#stock-lookup-form").on("ajax:error", function(even, xhr, status, error) {
    $("#stock-lookup-results").replaceWith('');
    $("#stock-lookup-errors").replaceWith("Invalid stock.");
  
  });
  
};

$(document).ready(function(){
  init_stock_lookup();
  
});