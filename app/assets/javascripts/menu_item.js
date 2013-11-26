var MenuItem = {
  init: function() {
    $('a.new-menu-item').on('click', this.toggleMenuItemForm);
    $('form#new_menu_item').on('ajax:success', this.appendMenuItem);
    $('form#new_menu_item').on('ajax:error', this.appendErrors);
  },

  toggleMenuItemForm: function(e) {
    e.preventDefault();
    $('form#new_menu_item').toggleClass('hidden');
  },

  appendMenuItem: function(event, data, status, xhr) {
    $('ul.menu-items').append(data.menu_item_template);
  },

  appendErrors: function(event, xhr, status, error) {
    console.log(event)
    console.log(xhr)
    console.log(status)
    console.log(error)
    $('ul.menu-items').before($.parseJSON(xhr.responseText).error);
  }
}

$(document).ready(function() {
  MenuItem.init();
})
