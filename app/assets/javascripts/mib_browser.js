$(document).ready(function() {
  $("input[name='mib_filter']").keyup(function() {
    var filter = $(this).val();
    
    $("div.mib-list ul li").each(function() {
      if ($(this).text().search(new RegExp(filter, "i")) < 0) {
        $(this).fadeOut();
      } else {
        $(this).show();
      }
    });
  })
});