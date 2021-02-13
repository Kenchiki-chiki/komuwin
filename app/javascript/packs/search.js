$(document).on('turbolinks:load', function() {
  $(".js-text-field").on("input", searchEvent);
  function searchEvent() { 
      const $search_value = $(this).val().toLowerCase();
      $('.js-interview_sheets .interview_sheet-cell').each(function() {
        const interview_sheet_title = $(this).find('h3').text().toLowerCase();
        if (interview_sheet_title.includes($search_value)) {
          $(this).show();
        } else {
          $(this).hide();
        }
      })  
  }
})