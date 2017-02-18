document.addEventListener("turbolinks:load", function() {
    $( "#search" ).delay(1500).autocomplete({
        source: '/search_seggestions'
    });
});