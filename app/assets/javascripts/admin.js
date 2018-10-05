//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require mui
//= require siema/dist/siema.min.js
//= require izitoast/dist/js/iziToast.min.js
//= require_tree ./admin



document.addEventListener('turbolinks:load', () => {
    console.log('Hello from AdminLand')

    iziToast.show({
        title: 'Welcome',
        message: 'Hello admin!'
    });
})

