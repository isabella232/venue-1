//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require mui
//= require siema/dist/siema.min.js
//= require izitoast/dist/js/iziToast.min.js
//= require transform_menu
//= require toast
//= require_tree ./admin

document.addEventListener('turbolinks:load', () => {
    transformMenu()


    iziToast.show({
        title: 'Welcome',
        message: 'Hello admin!'
    });
})


