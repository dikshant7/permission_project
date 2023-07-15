$(document).ready(function() {
    $('#submitAllForms').click(function() {
        $('form').each(function() {
            $(this).submit();
        });
    });
});