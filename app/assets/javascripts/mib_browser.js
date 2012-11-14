$.ready(
  $("input[name='mib_filter']").keyup(function() {
    var filter = $(this).val();
    var count = 0;
    
    $("div.mib-list ul li").each(function() {
      if ($(this).text().search(new RegExp(filter, "i")) < 0) {
        $(this).fadeOut();
      } else {
        $(this).show();
        count++;
      }
    });
  })
);